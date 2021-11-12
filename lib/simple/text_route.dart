import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文本组件"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Hello World",
            textAlign: TextAlign.left,
          ),
          Text(
            "Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world ",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
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
          Text(
            "Hello World",
            textScaleFactor: 1.5,
          ),
          Text.rich(TextSpan(
            children: [
              TextSpan(
                text: "Hello World",
              ),
              TextSpan(
                text: "www.baidu.com",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          )),
          DefaultTextStyle(
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
            ),
            child: Column(
              children: [
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
