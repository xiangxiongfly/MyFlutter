import 'package:flutter/material.dart';

class LayoutBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LayoutBuilder"),
      ),
      body: LayoutBuilderRoute(),
    );
  }
}

class ChangeColumn extends StatelessWidget {
  final List<Widget> children;

  const ChangeColumn({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 200) {
          return Column(
            children: children,
            mainAxisSize: MainAxisSize.min,
          );
        } else {
          var _children = <Widget>[];
          for (int i = 0; i < children.length; i += 2) {
            if (i + 1 < children.length) {
              _children.add(Row(
                children: [children[i], children[i + 1]],
                mainAxisSize: MainAxisSize.min,
              ));
            } else {
              _children.add(children[i]);
            }
          }
          return Column(
            children: _children,
            mainAxisSize: MainAxisSize.min,
          );
        }
      },
    );
  }
}

class LayoutBuilderRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _children = List.filled(6, Text("A"));
    return Column(
      children: [
        SizedBox(
            width: 190,
            child: ChangeColumn(
              children: _children,
            )),
        ChangeColumn(children: _children),
        // LayoutLog
      ],
    );
  }
}
