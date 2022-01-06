import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformViewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlatformViewDemoState();
  }
}

class _PlatformViewDemoState extends State<PlatformViewDemo> {
  static const methodChannel = MethodChannel("com.example.myflutter.MyFlutterView");

  String _data = "";
  int _count = 0;

  @override
  void initState() {
    super.initState();

    /// 监听从Android平台发来的数据
    methodChannel.setMethodCallHandler(onMethod);
  }

  /// 监听方法
  Future<dynamic> onMethod(MethodCall call) async {
    if (call.method == "onFlutterMethod") {
      setState(() {
        _count = call.arguments["count"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget platformView() {
      if (defaultTargetPlatform == TargetPlatform.android) {
        /**
         * 向Android平台传递参数
         *
         * creationParams：传递的参数，传递给AndroidView的构造函数
         * creationParamsCodec：编码器。将creationParams编码后发送给平台，应该与构造函数的编码器匹配
         */
        return AndroidView(
          viewType: "plugins.flutter.io/custom_platform_view",
          onPlatformViewCreated: (int id) {},
          creationParams: {"param1": "hello", "param2": "world"},
          creationParamsCodec: StandardMessageCodec(),
        );
      }
      return const Text("空白");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("嵌入原生 Android View"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("从Android平台接收数据：$_count"),
            Divider(),
            OutlinedButton(
              onPressed: () async {
                var result = await methodChannel.invokeMapMethod("getData", {"param": "hello world"});
                setState(() {
                  _data = result!["content"];
                });
              },
              child: const Text("Flutter从Android View获取数据"),
            ),
            Text(_data),
            Divider(),
            const Text("Android View"),
            OutlinedButton(
              onPressed: () {
                methodChannel.invokeMethod("setData", {"name": "小明", "age": 18});
              },
              child: const Text("Flutter向Android View发送数据"),
            ),
            Expanded(
              child: platformView(),
            ),
          ],
        ),
      ),
    );
  }
}
