import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("文本组件"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 100,
            child: const Text(
              "Hello World",
              textAlign: TextAlign.left,
            ),
          ),
          const Text(
            "Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world ",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Text(
            "Hello World",
            textScaleFactor: 1.5,
          ),
          Text(
            "Hello World",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              height: 2.5,
              fontFamily: "Courier",
              background: Paint()..color = Colors.grey,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed,
            ),
          ),
          const Text(
            "Hello World",
            textScaleFactor: 1.5,
          ),
          const Text.rich(TextSpan(
            children: [
              TextSpan(
                text: "Hello World",
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
                text: "Hello World222",
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
        ],
      ),
    );
  }
}
