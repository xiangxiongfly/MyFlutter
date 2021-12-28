import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

/// 过渡
class AnimationCurvePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationCurvePageState();
}

class _AnimationCurvePageState extends State<AnimationCurvePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000))
      ..addListener(() {
        setState(() {});
      });
    _animation = Tween(begin: 100.0, end: 200.0).chain(CurveTween(curve: Curves.bounceInOut)).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Curve"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller.forward();
          },
          child: Container(
            width: _animation.value,
            height: _animation.value,
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
