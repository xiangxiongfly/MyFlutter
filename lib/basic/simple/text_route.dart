import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var route = ModalRoute.of(context);
    Map<String, dynamic>? _arguments;
    if (route != null) {
      _arguments = route.settings.arguments as Map<String, dynamic>?;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Text组件"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("姓名：${_arguments != null ? _arguments["name"] : ""}"),
          Text("年龄：${_arguments != null ? _arguments["age"] : ""}"),
          Text("地址：${_arguments != null ? _arguments["address"] : ""}"),
          const Text(
            "1.hello world",
          ),
          const Text(
            "2.Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world ",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Text(
            "3.Hello World",
            textScaleFactor: 1.5,
          ),
          Text(
            "4.Hello World",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontFamily: "Courier",
              background: Paint()..color = Colors.red,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed,
            ),
          ),
          const Text(
            "5.Hello World",
            textScaleFactor: 1.5,
          ),
          const Text.rich(TextSpan(
            children: [
              TextSpan(
                text: "6.Hello World",
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              TextSpan(
                text: "www.baidu.com",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          )),
          RichText(
            text: const TextSpan(children: [
              TextSpan(
                text: "7.Hello World",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              TextSpan(
                text: "www.baidu.com",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ]),
          ),
          DefaultTextStyle(
            style: const TextStyle(
              color: Colors.red,
              fontSize: 20,
            ),
            child: Column(
              children: const [
                Text("AAA"),
                Text("BBB"),
                Text("CCC"),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: const Text(
              "8.Hello World",
            ),
          ),
          Container(
            color: Colors.green,
            width: double.infinity,
            height: 100,
            child: const Text(
              "9.Hello World",
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            color: Colors.red,
            width: double.infinity,
            alignment: Alignment.center,
            height: 100,
            child: const Text(
              "9.Hello World",
            ),
          ),
        ],
      ),
    );
  }
}
