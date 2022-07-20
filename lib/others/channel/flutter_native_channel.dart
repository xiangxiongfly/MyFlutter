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

  /// MethodChannel
  /// 参数1：通信标识
  /// 参数2：codec为编码方式
  /// 参数3：binaryMessenger消息通道
  static const methodChannel = MethodChannel("flutter_and_native_100");

  static Future<dynamic> invokeNative(String method, {Map<String, dynamic>? arguments}) async {
    if (arguments == null) {
      return await methodChannel.invokeMethod(method);
    } else {
      return await methodChannel.invokeMethod(method, arguments);
    }
  }

  /// 调用Android无参方法并获取返回值
  sendMessage() async {
    dynamic value = await invokeNative("test");
    int code = value["code"];
    String message = value["message"];
    setState(() {
      _result = "调用native方法\n 获取返回值： code:$code message:$message";
    });
  }

  /// 调用Android有参方法并获取返回值
  sendMessage2() async {
    dynamic value = await invokeNative("test2", arguments: {"name": "hello world"});
    int code = value["code"];
    String message = value["message"];
    setState(() {
      _result = "调用native方法\n 获取返回值： code:$code message:$message";
    });
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
            child: const Text("无参调用Native方法"),
          ),
          ElevatedButton(
            onPressed: () {
              sendMessage2();
            },
            child: const Text("有参调用Native方法"),
          ),
        ],
      ),
    );
  }
}
