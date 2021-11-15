import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("布局组件"),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              child: const Text("约束布局组件"),
              onPressed: () {
                Navigator.pushNamed(context, "constraint_route");
              },
            ),
            RaisedButton(
              child: const Text("Row&Column组件"),
              onPressed: () {
                Navigator.pushNamed(context, "linear_route");
              },
            ),
            RaisedButton(
              child: const Text("弹性布局组件"),
              onPressed: () {
                Navigator.pushNamed(context, "flex_route");
              },
            ),
            RaisedButton(
              child: const Text("流式布局组件"),
              onPressed: () {
                Navigator.pushNamed(context, "wrap_flow_route");
              },
            ),
            RaisedButton(
              child: const Text("层叠布局组件"),
              onPressed: () {
                Navigator.pushNamed(context, "stack_positioned_route");
              },
            ),
            RaisedButton(
              child: const Text("对齐相对布局组件"),
              onPressed: () {
                Navigator.pushNamed(context, "align_route");
              },
            ),
            RaisedButton(
              child: const Text("Center组件"),
              onPressed: () {
                Navigator.pushNamed(context, "center_route");
              },
            ),
            RaisedButton(
              child: const Text("LayoutBuilder组件"),
              onPressed: () {
                Navigator.pushNamed(context, "layout_builder_route");
              },
            )
          ],
        ),
      ),
    );
  }
}

Widget childWidget = DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);
