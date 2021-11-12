import 'package:flutter/material.dart';

class CenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Center组件"),
      ),
      body: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              child: Text("ABC"),
            ),
          ),
          SizedBox(height: 10),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              widthFactor: 1,
              heightFactor: 1,
              child: Text("EFG"),
            ),
          ),
          SizedBox(height: 10),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              widthFactor: 2,
              heightFactor: 2,
              child: Text("EFG"),
            ),
          ),
        ],
      ),
    );
  }
}
