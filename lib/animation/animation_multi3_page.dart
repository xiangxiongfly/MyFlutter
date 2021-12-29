import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

/// 多动画混合使用
class AnimationMulti3Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimationMulti3PageState();
  }
}

class _AnimationMulti3PageState extends State<AnimationMulti3Page> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))
      ..addListener(() {
        setState(() {});
      });
    _animation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 100.0, end: 200.0).chain(CurveTween(curve: Curves.easeIn)), weight: 40),
      TweenSequenceItem(tween: ConstantTween<double>(200.0), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 200.0, end: 300.0), weight: 40),
    ]).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("先变大暂停一段再变大"),
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
              "先变大暂停一段再变大",
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
