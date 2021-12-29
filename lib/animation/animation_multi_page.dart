import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

/// 多动画混合使用
class AnimationMultiPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationMultiPageState();
}

class _AnimationMultiPageState extends State<AnimationMultiPage> with TickerProviderStateMixin {
  late AnimationController _sizeController;
  late AnimationController _colorController;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _sizeController = AnimationController(vsync: this, duration: Duration(seconds: 2))
      ..addListener(() {
        setState(() {});
      });
    _sizeAnimation = _sizeController.drive(CurveTween(curve: Curves.linear)).drive(Tween(begin: 100, end: 200));

    _colorController = AnimationController(vsync: this, duration: Duration(seconds: 2))
      ..addListener(() {
        setState(() {});
      });
    _colorAnimation =
        _colorController.drive(CurveTween(curve: Curves.linear)).drive(ColorTween(begin: Colors.blue, end: Colors.red));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("同时变大变色"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _sizeController.forward();
            _colorController.forward();
          },
          child: Container(
            width: _sizeAnimation.value,
            height: _sizeAnimation.value,
            color: _colorAnimation.value,
            alignment: Alignment.center,
            child: const Text(
              "变大变色",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _sizeController.dispose();
    _colorController.dispose();
    super.dispose();
  }
}
