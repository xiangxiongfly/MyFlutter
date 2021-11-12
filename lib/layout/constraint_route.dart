
import 'package:flutter/material.dart';

class ConstraintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("约束布局组件"),
        actions: [
          UnconstrainedBox(
            child: SizedBox(
              width: 10,
              height: 10,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.grey),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: double.infinity,
                minHeight: 50,
                maxHeight: 100,
              ),
              child: Container(
                height: 5,
                child: childWidget,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              width: 50,
              height: 50,
              child: childWidget,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 100, minHeight: 100),
              child: UnconstrainedBox(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 50, minHeight: 50),
                  child: childWidget,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget childWidget = DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);
