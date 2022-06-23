import 'package:flutter/material.dart';

class BuilderPage extends StatelessWidget {
  const BuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Builder组件"),
      ),
      body: Builder(
        builder: (context) {
          return Center(
            child: RaisedButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                showSnackBar(context);
              },
              child: const Text('show SnackBar'),
            ),
          );
        }
      ),
    );
  }

  showSnackBar(BuildContext context) {
    const snackBar = SnackBar(content: Text('老孟'));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
