import 'package:flutter/material.dart';

class ScaleTransitionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScaleTransitionPageState();
}

class _ScaleTransitionPageState extends State<ScaleTransitionPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _opacity = 1.0;

  late AnimationController _multiController;
  late Animation<Color?> _colorAnimation;
  late Animation<Size?> _sizeAnimation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(begin: 1.0, end: 0.1).animate(_controller);
    _multiController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.red).animate(_multiController);
    _sizeAnimation = SizeTween(begin: Size(100.0, 50.50), end: Size(50.0, 100.0)).animate(_multiController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画组件"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              OutlinedButton(
                onPressed: () {
                  _controller.forward();
                },
                child: Text("变小"),
              ),
              OutlinedButton(
                onPressed: () {
                  _controller.reset();
                },
                child: Text("变小重置"),
              ),
            ],
          ),
          Row(
            children: [
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    _opacity = 0;
                  });
                },
                child: Text("透明"),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    _opacity = 1.0;
                  });
                },
                child: Text("透明重置"),
              ),
            ],
          ),
          Row(
            children: [
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    _multiController.forward();
                  });
                },
                child: Text("变形变色"),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    _multiController.reset();
                  });
                },
                child: Text("变形变色重置"),
              ),
            ],
          ),
          ScaleTransition(
            scale: _animation,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
              alignment: Alignment.center,
              child: Text("变小"),
            ),
          ),
          const SizedBox(height: 10),
          AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(seconds: 2),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
              alignment: Alignment.center,
              child: Text("透明"),
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
                child: Text("变形变色"),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _multiController.dispose();
    super.dispose();
  }
}
