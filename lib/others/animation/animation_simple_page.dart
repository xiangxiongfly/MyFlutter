import 'dart:math';

import 'package:flutter/material.dart';

class AnimationSimplePage extends StatefulWidget {
  const AnimationSimplePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AnimationSimplePageState();
}

class _AnimationSimplePageState extends State<AnimationSimplePage>
    with TickerProviderStateMixin {
  double _size = 100;
  double _opacity = 1;
  double _rotation = 1;
  late AnimationController _scaleController;
  late AnimationController _alphaController;
  late AnimationController _rotationController;
  late AnimationController _slideController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        lowerBound: 100,
        upperBound: 200)
      // ..addStatusListener((status) {
      //   switch (status) {
      //     case AnimationStatus.dismissed:
      //       print("dismissed");
      //       _scaleController.forward();
      //       break;
      //     case AnimationStatus.forward:
      //       print("forward");
      //       break;
      //     case AnimationStatus.reverse:
      //       print("reverse");
      //       break;
      //     case AnimationStatus.completed:
      //       _scaleController.reverse();
      //       break;
      //   }
      // })
      ..addListener(() {
        setState(() {
          _size = _scaleController.value;
        });
      });

    _alphaController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..addListener(() {
            setState(() {
              _opacity = _alphaController.value;
            });
          });

    _rotationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        lowerBound: 1,
        upperBound: 2)
      ..addListener(() {
        setState(() {
          _rotation = _rotationController.value;
        });
      });

    _slideController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..addListener(() {
            setState(() {});
          });
    _animation = Tween(begin: const Offset(0, 0), end: const Offset(100, 100))
        .animate(_slideController);
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _alphaController.dispose();
    _rotationController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("动画基本使用"),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry>[
                PopupMenuItem(child: const Text('缩放动画'), onTap: _scaleAnim),
                PopupMenuItem(child: const Text('透明度动画'), onTap: _alphaAnim),
                PopupMenuItem(child: const Text('旋转动画'), onTap: _rotationAnim),
                PopupMenuItem(child: const Text('平移动画'), onTap: _slideAnim),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Transform.translate(
          offset: _animation.value,
          child: Container(
            width: _size,
            height: _size / 2,
            color: Colors.red.withOpacity(_opacity),
            transformAlignment: Alignment.center,
            transform: Matrix4.rotationZ(pi / _rotation),
          ),
        ),
      ),
    );
  }

  /// 缩放动画
  void _scaleAnim() {
    _scaleController.forward();
  }

  /// 透明度动画
  void _alphaAnim() {
    _alphaController.forward();
  }

  /// 旋转动画
  void _rotationAnim() {
    _rotationController.forward();
  }

  /// 平移动画
  void _slideAnim() {
    _slideController.forward();
  }
}
