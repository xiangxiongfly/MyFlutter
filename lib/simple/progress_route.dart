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
        title: Text("进度条组件"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            SizedBox(height: 20),
            LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.red),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              strokeWidth: 2.0,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.red),
              value: 0.5,
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 3,
              width: 100,
              child: LinearProgressIndicator(
                value: 0.5,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                value: 0.5,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            Text("3秒由灰色变蓝色动画"),
            LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                  .animate(_animationController),
              value: _animationController.value,
            ),
          ],
        ),
      ),
    );
  }
}
