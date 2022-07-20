import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myflutter/utils/snack_bar_utils.dart';

/// Flutter与原生双向通信
class FlutterNativeChannel extends StatefulWidget {
  const FlutterNativeChannel({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FlutterNativeChannelState();
  }
}

class _FlutterNativeChannelState extends State<FlutterNativeChannel> {
  String _result = "";

  /// MethodChannel
  /// 参数1：通信标识
  /// 参数2：codec为编码方式
  /// 参数3：binaryMessenger消息通道
  static const methodChannel = MethodChannel("flutter_and_native_100");

  /// BasicMessageChannel
  static const basicMessageChannel =
      BasicMessageChannel("flutter_and_native_200", StandardMessageCodec());

  static Future<dynamic> invokeNative(String method, {Map<String, dynamic>? arguments}) async {
    if (arguments == null) {
      return await methodChannel.invokeMethod(method);
    } else {
      return await methodChannel.invokeMethod(method, arguments);
    }
  }

  /// MethodChannel：调用Android无参方法并获取返回值
  sendMessage() async {
    dynamic value = await invokeNative("test");
    int code = value["code"];
    String message = value["message"];
    setState(() {
      _result = "调用native方法\n 获取返回值： code:$code message:$message";
    });
  }

  /// MethodChannel：调用Android有参方法并获取返回值
  sendMessage2() async {
    dynamic value = await invokeNative("test2", arguments: {"name": "hello world"});
    int code = value["code"];
    String message = value["message"];
    setState(() {
      _result = "调用native方法\n 获取返回值： code:$code message:$message";
    });
  }

  /// MethodChannel
  sendMessage3() async {
    await invokeNative("test3");
  }

  /// MethodChannel：监听消息
  nativeMessageListener() {
    methodChannel.setMethodCallHandler((call) async {
      print("MethodChannel：收到监听");
      String methodName = call.method;
      Map arguments = call.arguments;
      int code = arguments["code"];
      String message = arguments["message"];
      setState(() {
        _result = "监听消息 method:$methodName code:$code message:$message";
      });
    });
  }

  /// BasicMessageChannel：发送消息
  sendMessage4() async {
    Map<String, dynamic> arguments = {"method": "test4"};
    Map result = await basicMessageChannel.send(arguments) as Map;
    int code = result["code"];
    String message = result["message"];
    setState(() {
      _result = "收到消息：code:$code message:$message";
    });
  }

  /// BasicMessageChannel：接收消息

  @override
  void initState() {
    super.initState();
    nativeMessageListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter与原生双向通信"),
      ),
      body: Column(
        children: [
          Text(_result),
          ElevatedButton(
            onPressed: () {
              sendMessage();
            },
            child: const Text("Flutter无参调用Native方法"),
          ),
          ElevatedButton(
            onPressed: () {
              sendMessage2();
            },
            child: const Text("Flutter有参调用Native方法"),
          ),
          ElevatedButton(
            onPressed: () {
              sendMessage3();
            },
            child: const Text("触发Android调Flutter"),
          ),
          ElevatedButton(
            onPressed: () {
              sendMessage4();
            },
            child: const Text("Flutter调Android"),
          ),
        ],
      ),
    );
  }
}
