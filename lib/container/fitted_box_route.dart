import 'package:flutter/material.dart';

class FittedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FittedBox")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("原始"),
            Container(
              width: 50,
              height: 50,
              color: Colors.red,
              child: Container(
                width: 60,
                height: 70,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 10),
            Text("BoxFit.none"),
            Container(
              width: 50,
              height: 50,
              color: Colors.red,
              child: FittedBox(
                fit: BoxFit.none,
                child: Container(
                  width: 60,
                  height: 70,
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text("BoxFit.contain"),
            Container(
              width: 50,
              height: 50,
              color: Colors.red,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  width: 60,
                  height: 70,
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
