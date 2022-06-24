import 'package:flutter/material.dart';

/// 过渡
class AnimationTweenPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationTweenPageState();
}

class _AnimationTweenPageState extends State<AnimationTweenPage> with SingleTickerProviderStateMixin {
  final Color _startColor = Colors.green;
  final Color _endColor = Colors.blue;
  late Color _color;
  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _color = _startColor;
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000))
      ..addListener(() {
        setState(() {
          // _color = Color.lerp(_startColor, _endColor, _controller.value)!;
        });
      });
    _animation = ColorTween(begin: _startColor, end: _endColor).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("区间动画"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller.forward();
          },
          child: Container(
            width: 100,
            height: 100,
            // color: _color,
            color: _animation.value,
            alignment: Alignment.center,
            child: const Text(
              "变色",
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
