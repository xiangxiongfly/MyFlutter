import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProgressPageState();
  }
}

class _ProgressPageState extends State<ProgressPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("进度条组件"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text("模糊进度条"),
            const LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            const Text("具体进度条"),
            const LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            const SizedBox(height: 20),
            const Text("模糊进度条"),
            const CircularProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.red),
            ),
            const Text("具体进度条"),
            const CircularProgressIndicator(
              //边框宽度
              strokeWidth: 2.0,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.red),
              value: 0.5,
            ),
            const SizedBox(height: 20),
            const Text("条形进度条设置宽高"),
            const SizedBox(
              height: 3,
              width: 100,
              child: LinearProgressIndicator(
                value: 0.5,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            ),
            const SizedBox(height: 20),
            const Text("环进度条设置宽高"),
            const SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                value: 0.5,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            ),
            const SizedBox(height: 20),
            const Text("3秒由灰色变蓝色动画"),
            LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                  .animate(_animationController),
              value: _animationController.value,
            ),
            const Text("ios风格"),
            const CupertinoActivityIndicator(
              radius: 10,
              animating: true,
            ),
          ],
        ),
      ),
    );
  }
}
