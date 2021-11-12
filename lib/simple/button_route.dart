import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("文本组件"),
        ),
        body: Column(
          children: [
            ElevatedButton(
              child: Text("漂浮按钮"),
              onPressed: () {},
            ),
            TextButton(
              child: Text("文本按钮"),
              onPressed: () {},
            ),
            OutlineButton(
              child: Text("边框按钮"),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("添加"),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.delete),
              label: Text("删除"),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.info),
              label: Text("详情"),
            ),
          ],
        ));
  }
}
