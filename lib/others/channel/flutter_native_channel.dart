import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  String _result2 = "";

  /// MethodChannel
  /// 参数1：通信标识
  /// 参数2：codec为编码方式
  /// 参数3：binaryMessenger消息通道
  static const methodChannel = MethodChannel("flutter_and_native_100");

  /// BasicMessageChannel
  static const basicMessageChannel =
      BasicMessageChannel("flutter_and_native_200", StandardMessageCodec());

  /// EventChannel
  static const eventChannel = EventChannel("flutter_and_native_300");

  static Future<dynamic> invokeNative(String method, {Map<String, dynamic>? arguments}) async {
    if (arguments == null) {
      return await methodChannel.invokeMethod(method);
    } else {
      return await methodChannel.invokeMethod(method, arguments);
    }
  }

  /// MethodChannel：调用Android无参方法并获取返回值
  sendByMethodChannel() async {
    dynamic value = await invokeNative("test");
    int code = value["code"];
    String message = value["message"];
    setState(() {
      _result = "调用native方法\n 获取返回值： code:$code message:$message";
    });
  }

  /// MethodChannel：调用Android有参方法并获取返回值
  sendByMethodChannel2() async {
    dynamic value = await invokeNative("test2", arguments: {"name": "hello world"});
    int code = value["code"];
    String message = value["message"];
    setState(() {
      _result = "调用native方法\n 获取返回值： code:$code message:$message";
    });
  }

  /// MethodChannel
  sendByMethodChannel3() async {
    await invokeNative("test3");
  }

  /// MethodChannel：监听消息
  receiveByMethodChannel() {
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
  sendByBasicMessageChannel() async {
    Map<String, dynamic> arguments = {"method": "test4"};
    Map result = await basicMessageChannel.send(arguments) as Map;
    int code = result["code"];
    String message = result["message"];
    setState(() {
      _result = "收到消息：code:$code message:$message";
    });
  }

  /// BasicMessageChannel
  sendByBasicMessageChannel2() async {
    Map<String, dynamic> arguments = {"method": "test5"};
    await basicMessageChannel.send(arguments);
  }

  /// BasicMessageChannel：接收消息
  receiveByBasicMessageChannel() {
    basicMessageChannel.setMessageHandler((result) async {
      print("BasicMessageChannel：收到监听");
      if (result != null) {
        dynamic map = result as dynamic;
        int code = map["code"];
        String message = map["message"];
        setState(() {
          _result = "收到消息：code:$code message:$message";
        });
      }
      return null;
    });
  }

  StreamSubscription? subscription;

  /// EventChannel：接收消息
  receiveByEventChannel() {
    subscription = eventChannel.receiveBroadcastStream().listen((event) {
      setState(() {
        _result2 = event.toString();
      });
    }, onError: (event) {
      setState(() {
        _result2 = event.toString();
      });
    });
  }

  unreceiveByEventChannel() {
    subscription?.cancel();
    subscription = null;
  }

  @override
  void initState() {
    super.initState();
    receiveByMethodChannel();
    receiveByBasicMessageChannel();
    receiveByEventChannel();
  }

  @override
  void dispose() {
    unreceiveByEventChannel();
    super.dispose();
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
          Text(_result2),
          ElevatedButton(
            onPressed: () {
              sendByMethodChannel();
            },
            child: const Text("Flutter无参调用Native方法"),
          ),
          ElevatedButton(
            onPressed: () {
              sendByMethodChannel2();
            },
            child: const Text("Flutter有参调用Native方法"),
          ),
          ElevatedButton(
            onPressed: () {
              sendByMethodChannel3();
            },
            child: const Text("触发Android调Flutter"),
          ),
          ElevatedButton(
            onPressed: () {
              sendByBasicMessageChannel();
            },
            child: const Text("Flutter调Android"),
          ),
          ElevatedButton(
            onPressed: () {
              sendByBasicMessageChannel2();
            },
            child: const Text("触发Android调Flutter"),
          ),
          buildAndroidView(),
        ],
      ),
    );
  }

  buildAndroidView() {
    return SizedBox(
      height: 200,
      child: AndroidView(
        //设置标识
        viewType: "com.hello.world",
        //参数
        creationParams: const {
          "content": "hello world",
          "color": "#ffff0000",
        },
        //Android View创建后回调
        onPlatformViewCreated: (int id) {},
        //编码方式
        creationParamsCodec: const StandardMessageCodec(),
      ),
    );
  }
}
