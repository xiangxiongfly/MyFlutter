import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myflutter/demos/slide.dart';

/// 变大
class AnimationSimplePage extends StatefulWidget {
  const AnimationSimplePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AnimationSimplePageState();
}

class _AnimationSimplePageState extends State<AnimationSimplePage> with TickerProviderStateMixin {
  double _size = 100;
  double _opacity = 1;
  late AnimationController _scaleController;
  late AnimationController _alphaController;
  late AnimationController _slideController;
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _scaleController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2), lowerBound: 100, upperBound: 200)
          ..addListener(() {
            setState(() {
              _size = _scaleController.value;
            });
          });

    _alphaController = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..addListener(() {
        setState(() {
          _opacity = _alphaController.value;
        });
      });

    _slideController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2), lowerBound: 0, upperBound: 100);

    _rotationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2), lowerBound: 0, upperBound: 0.25);
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
                PopupMenuItem(child: const Text('平移动画'), onTap: _translationAnim),
                PopupMenuItem(child: const Text('旋转动画'), onTap: _rotationAnim),
                PopupMenuItem(child: const Text('reverse'), onTap: _reverse),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: SlideTransition(
          position: _slideController,
          child: RotationTransition(
            turns: _rotationController,
            child: Container(
              width: _size,
              height: _size / 2,
              color: Colors.red.withOpacity(_opacity),
              transformAlignment: Alignment.center,
            ),
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

  /// 平移动画
  void _translationAnim() {
    _slideController.forward();
  }

  /// 旋转动画
  void _rotationAnim() {
    _rotationController.forward();
  }
}
