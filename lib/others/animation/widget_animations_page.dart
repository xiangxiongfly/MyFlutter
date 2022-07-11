import 'package:flutter/material.dart';

class ScaleTransitionPage extends StatefulWidget {
  const ScaleTransitionPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScaleTransitionPageState();
}

class _ScaleTransitionPageState extends State<ScaleTransitionPage> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  double _opacity = 1.0;

  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  late AnimationController _multiController;
  late Animation<Color?> _colorAnimation;
  late Animation<Size?> _sizeAnimation;

  @override
  void initState() {
    _scaleController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _scaleAnimation = Tween(begin: 1.0, end: 0.1).animate(_scaleController);

    _slideController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _slideAnimation =
        Tween(begin: const Offset(-1, 0), end: const Offset(0, 0)).animate(_slideController);

    _rotationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _rotationAnimation = Tween(begin: 0.0, end: 0.5).animate(_rotationController);

    _multiController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.red).animate(_multiController);
    _sizeAnimation = SizeTween(begin: const Size(100.0, 50.50), end: const Size(50.0, 100.0))
        .animate(_multiController);

    super.initState();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _slideController.dispose();
    _rotationController.dispose();
    _multiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("动画组件"),
        actions: _buildActions(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: _buildColumn(),
        ),
      ),
    );
  }

  List<Widget> _buildActions() {
    return [
      PopupMenuButton(
        itemBuilder: (BuildContext context) {
          return <PopupMenuEntry>[
            PopupMenuItem(
                onTap: () {
                  _scaleController.forward();
                },
                child: const Text('变小')),
            PopupMenuItem(
                onTap: () {
                  _scaleController.reset();
                },
                child: const Text('变小重置')),
            PopupMenuItem(
                onTap: () {
                  setState(() {
                    _opacity = 0;
                  });
                },
                child: const Text('透明')),
            PopupMenuItem(
                onTap: () {
                  setState(() {
                    _opacity = 1.0;
                  });
                },
                child: const Text('透明重置')),
            PopupMenuItem(
                onTap: () {
                  _slideController.forward();
                },
                child: const Text("移动")),
            PopupMenuItem(
                onTap: () {
                  _slideController.reset();
                },
                child: const Text("移动重置")),
            PopupMenuItem(
                onTap: () {
                  _rotationController.forward();
                },
                child: const Text("旋转")),
            PopupMenuItem(
                onTap: () {
                  _rotationController.reset();
                },
                child: const Text("旋转重置")),
            PopupMenuItem(
              onTap: () {
                setState(() {
                  _multiController.forward();
                });
              },
              child: const Text("变形变色"),
            ),
            PopupMenuItem(
              onTap: () {
                setState(() {
                  _multiController.reset();
                });
              },
              child: const Text("变形变色重置"),
            ),
          ];
        },
      ),
    ];
  }

  Widget _buildColumn() {
    return Column(
      children: [
        ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
            alignment: Alignment.center,
            child: const Text("变小"),
          ),
        ),
        const SizedBox(height: 10),
        AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 2),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text("透明"),
          ),
        ),
        const SizedBox(height: 10),
        SlideTransition(
          position: _slideAnimation,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.yellow,
            alignment: Alignment.center,
            child: const Text("移动"),
          ),
        ),
        const SizedBox(height: 10),
        RotationTransition(
          alignment: Alignment.center,
          turns: _rotationAnimation,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.pink,
            alignment: Alignment.center,
            child: const Text("旋转"),
          ),
        ),
        const SizedBox(height: 10),
        AnimatedBuilder(
          animation: _multiController,
          builder: (context, widget) {
            return Container(
              width: _sizeAnimation.value!.width,
              height: _sizeAnimation.value!.height,
              color: _colorAnimation.value,
              alignment: Alignment.center,
              child: const Text("同时变形变色"),
            );
          },
        ),
      ],
    );
  }
}
