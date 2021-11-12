import 'package:flutter/material.dart';

class PaddingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Padding")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("hello world"),
              ),
            ),
            Container(
              color: Colors.green,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
                child: Text("hello world"),
              ),
            ),
            Container(
              color: Colors.blue,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text("hello world"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
