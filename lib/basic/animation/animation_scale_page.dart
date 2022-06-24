import 'package:flutter/material.dart';

/// 变大
class AnimationScalePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationScalePageState();
}

class _AnimationScalePageState extends State<AnimationScalePage> with SingleTickerProviderStateMixin {
  double _size = 100;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 5000), lowerBound: 100, upperBound: 200)
          // ..addStatusListener((status) {
          //   switch (status) {
          //     case AnimationStatus.dismissed:
          //       print("dismissed");
          //       _controller.forward();
          //       break;
          //     case AnimationStatus.forward:
          //       print("forward");
          //       break;
          //     case AnimationStatus.reverse:
          //       print("reverse");
          //       break;
          //     case AnimationStatus.completed:
          //       print("completed");
          //       _controller.reverse();
          //       break;
          //   }
          // })
          ..addListener(() {
            setState(() {
              // print(_controller.value);
              _size = _controller.value;
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("缩放动画"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller.forward();
          },
          child: Container(
            width: _size,
            height: _size,
            color: Colors.red,
            alignment: Alignment.center,
            child: const Text(
              "变大",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
