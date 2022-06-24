import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformPage extends StatelessWidget {
  const TransformPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("math.pi/2   ${math.pi / 2}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transform"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              child: Transform.translate(
                offset: const Offset(10, 10),
                child: const Text("hello world"),
              ),
              decoration: const BoxDecoration(color: Colors.red),
            ),
            const SizedBox(height: 50),
            DecoratedBox(
              child: Transform.rotate(
                angle: math.pi / 2,
                child: const Text("hello world"),
              ),
              decoration: const BoxDecoration(color: Colors.red),
            ),
            const SizedBox(height: 50),
            DecoratedBox(
              child: Transform.scale(
                scale: 2,
                child: const Text("hello world"),
              ),
              decoration: const BoxDecoration(color: Colors.red),
            ),
            const SizedBox(height: 80),
            Container(
              color: Colors.black,
              child: Transform(
                alignment: Alignment.topRight,
                transform: Matrix4.skewY(0.3),
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.red,
                  child: const Text("  hello transform!  "),
                ),
              ),
            ),
            const SizedBox(height: 50),
            const DecoratedBox(
              child: RotatedBox(
                quarterTurns: 1,
                child: Text("hello world"),
              ),
              decoration: BoxDecoration(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
