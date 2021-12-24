import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class DemoWidget extends StatefulWidget {
  late final String text;

  DemoWidget(this.text);

  @override
  State<StatefulWidget> createState() => _DemoWidgetState(text);
}

class _DemoWidgetState extends State<DemoWidget> {
  late String text;
  final GlobalKey globalKey = GlobalKey();

  _DemoWidgetState(this.text);

  Future<String> getNetworkData() async {
    await Future.delayed(Duration(seconds: 2));
    return "hello world";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getNetworkData(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Text("加载中");
              case ConnectionState.done:
                if (snapshot.hasData) {
                  //成功
                  return Text("加载成功： ${snapshot.data}");
                } else {
                  //失败
                  return Text("加载失败： ${snapshot.error}");
                }
              default:
                return Text("");
            }
          },
        ),
      ),
    );
  }
}
