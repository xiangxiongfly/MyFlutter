import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowPage extends StatelessWidget {
  const RowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Row组件"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: Colors.grey,
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColumnPage extends StatelessWidget {
  const ColumnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Column组件"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.grey,
          child: Column(
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
