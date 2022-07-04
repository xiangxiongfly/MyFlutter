import 'package:flutter/material.dart';

/// 过渡
class AnimationTweenPage extends StatefulWidget {
  const AnimationTweenPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AnimationTweenPageState();
}

class _AnimationTweenPageState extends State<AnimationTweenPage>
    with TickerProviderStateMixin {
  Color _color = Colors.green;
  late AnimationController _controller;

  final Color _startColor = Colors.yellow;
  final Color _endColor = Colors.red;
  late AnimationController _controller2;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000))
      ..addListener(() {
        setState(() {
          _color = Color.lerp(Colors.green, Colors.blue, _controller.value)!;
        });
      });
    _controller2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000))
      ..addListener(() {
        setState(() {});
      });
    _animation =
        ColorTween(begin: _startColor, end: _endColor).animate(_controller2);
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("区间动画"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                _controller.forward();
              },
              child: Container(
                width: 100,
                height: 100,
                color: _color,
                alignment: Alignment.center,
                child: const Text(
                  "变色",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                _controller2.forward();
              },
              child: Container(
                width: 100,
                height: 100,
                color: _animation.value,
                alignment: Alignment.center,
                child: const Text(
                  "变色",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
