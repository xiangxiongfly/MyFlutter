import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinearLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Row&Column组件"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("hello world"),
              Text("hello flutter"),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("hello world"),
              Text("hello flutter"),
            ],
          ),
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("hello world"),
              Text("hello flutter"),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: [
              Text(
                "hello world",
                style: TextStyle(fontSize: 30),
              ),
              Text("hello flutter"),
            ],
          ),
        ],
      ),
    );
  }
}
