import 'package:flutter/material.dart';

class LayoutBuilderPage extends StatelessWidget {
  const LayoutBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LayoutBuilder组件"),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          Color color = Colors.red;
          if (constraints.maxWidth > 360) {
            color = Colors.blue;
          }
          return Container(
            width: 50,
            height: 50,
            color: color,
          );
        },
      ),
    );
  }
}
