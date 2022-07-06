import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Button组件"),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: const Text("Material风格按钮"),
            onPressed: () {},
          ),
          ElevatedButton(
            child: const Text("漂浮按钮"),
            onPressed: () {},
            onLongPress: () {},
          ),
          TextButton(
            child: const Text("文本按钮"),
            onPressed: () {},
          ),
          OutlinedButton(
            child: const Text("边框按钮"),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {},
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text("添加"),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.delete),
            label: const Text("删除"),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.info),
            label: const Text("详情"),
          ),
        ],
      ),
    );
  }
}
