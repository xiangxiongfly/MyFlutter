import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card组件"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.flag),
                    title: Text("hello"),
                    subtitle: Text("真棒Card"),
                  ),
                  ButtonBar(
                    children: [
                      TextButton(onPressed: () {}, child: const Text("确定")),
                      TextButton(onPressed: () {}, child: const Text("设置")),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.green,
              elevation: 10,
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.flag),
                    title: Text("hello"),
                    subtitle: Text("真棒Card"),
                  ),
                  ButtonBar(
                    children: [
                      TextButton(onPressed: () {}, child: const Text("确定")),
                      TextButton(onPressed: () {}, child: const Text("设置")),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
