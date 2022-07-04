import 'package:flutter/material.dart';

/// 多动画混合使用
class AnimationMulti2Page extends StatefulWidget {
  const AnimationMulti2Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AnimationMulti2PageState();
}

class _AnimationMulti2PageState extends State<AnimationMulti2Page>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..addListener(() {
        setState(() {});
      });
    _sizeAnimation = _controller
        .drive(CurveTween(curve: const Interval(0.0, 0.5)))
        .drive(Tween(begin: 100, end: 200));
    _colorAnimation = _controller
        .drive(CurveTween(curve: const Interval(0.5, 1.0)))
        .drive(ColorTween(begin: Colors.blue, end: Colors.red));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("先变大再变色"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller.forward();
          },
          child: Container(
            width: _sizeAnimation.value,
            height: _sizeAnimation.value,
            color: _colorAnimation.value,
            alignment: Alignment.center,
            child: const Text(
              "先变大再变色",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
