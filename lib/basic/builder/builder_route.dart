import 'package:flutter/material.dart';
import 'package:myflutter/utils/snack_bar_utils.dart';

class BuilderPage extends StatelessWidget {
  const BuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Builder组件"),
      ),
      body: Builder(builder: (context) {
        return Center(
          child: RaisedButton(
            color: Colors.red,
            textColor: Colors.white,
            onPressed: () {
              showSnackBar(context, "hello Builder");
            },
            child: const Text('show SnackBar'),
          ),
        );
      }),
    );
  }
}
