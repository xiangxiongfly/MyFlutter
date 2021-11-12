import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("math.pi/2   ${math.pi / 2}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Trasnform"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              child: Transform.translate(
                offset: Offset(10, 10),
                child: Text("hello world"),
              ),
              decoration: BoxDecoration(color: Colors.red),
            ),
            SizedBox(height: 50),
            DecoratedBox(
              child: Transform.rotate(
                angle: math.pi / 2,
                child: Text("hello world"),
              ),
              decoration: BoxDecoration(color: Colors.red),
            ),
            SizedBox(height: 50),
            DecoratedBox(
              child: Transform.scale(
                scale: 2,
                child: Text("hello world"),
              ),
              decoration: BoxDecoration(color: Colors.red),
            ),
            SizedBox(height: 80),
            Container(
              color: Colors.black,
              child: Transform(
                alignment: Alignment.topRight,
                transform: Matrix4.skewY(0.3),
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.red,
                  child: Text("  hello transform!  "),
                ),
              ),
            ),
            SizedBox(height: 50),
            DecoratedBox(
              child: RotatedBox(
                quarterTurns: 1,
                child: Text("hello world"),
              ),
              decoration: BoxDecoration(color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
