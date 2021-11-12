import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100,
              height: 50,
              color: Colors.blue,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text("hello world"),
            ),
            Container(
              margin: EdgeInsets.all(50),
              constraints: BoxConstraints.tightFor(width: 200, height: 150),
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [Colors.blue.shade800, Colors.blue.shade200],
                  center: Alignment.center,
                  radius: 0.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
              transform: Matrix4.rotationZ(0.2),
              transformAlignment: Alignment.center,
              alignment: Alignment.center,
              child: Text("hello world"),
            )
          ],
        ),
      ),
    );
  }
}
