import 'package:flutter/material.dart';

class SimplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("基本组件"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text("文本组件"),
              onPressed: () {
                Navigator.pushNamed(context, "text_route");
              },
            ),
            ElevatedButton(
              child: Text("按钮组件"),
              onPressed: () {
                Navigator.pushNamed(context, "button_route");
              },
            ),
            ElevatedButton(
              child: Text("图片组件"),
              onPressed: () {
                Navigator.pushNamed(context, "image_route");
              },
            ),
            ElevatedButton(
              child: Text("单选按钮复选框组件"),
              onPressed: () {
                Navigator.pushNamed(context, "switch_checkbox_route");
              },
            ),
            ElevatedButton(
              child: Text("输入框组件"),
              onPressed: () {
                Navigator.pushNamed(context, "input_route");
              },
            ),
            ElevatedButton(
              child: Text("Form组件"),
              onPressed: () {
                Navigator.pushNamed(context, "form_route");
              },
            ),
            ElevatedButton(
              child: Text("进度条组件"),
              onPressed: () {
                Navigator.pushNamed(context, "progress_route");
              },
            ),
          ],
        ),
      ),
    );
  }
}
