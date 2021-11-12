import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("布局组件"),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              child: Text("约束布局组件"),
              onPressed: () {
                Navigator.pushNamed(context, "constraint_route");
              },
            ),
            RaisedButton(
              child: Text("线性布局组件"),
              onPressed: () {
                Navigator.pushNamed(context, "linear_route");
              },
            ),
            RaisedButton(
              child: Text("弹性布局组件"),
              onPressed: () {
                Navigator.pushNamed(context, "flex_route");
              },
            ),
            RaisedButton(
              child: Text("流式布局组件"),
              onPressed: () {
                Navigator.pushNamed(context, "wrap_flow_route");
              },
            ),
            RaisedButton(
              child: Text("层叠布局组件"),
              onPressed: () {
                Navigator.pushNamed(context, "stack_positioned_route");
              },
            ),
            RaisedButton(
              child: Text("对齐相对布局组件"),
              onPressed: () {
                Navigator.pushNamed(context, "align_route");
              },
            ),
            RaisedButton(
              child: Text("Center组件"),
              onPressed: () {
                Navigator.pushNamed(context, "center_route");
              },
            ),
            RaisedButton(
              child: Text("LayoutBuilder组件"),
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
