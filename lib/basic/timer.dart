import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int count = 0;
  Timer? _timer;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Timer定时任务"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("$count"),
            TextButton(
              onPressed: () {
                startTimer();
              },
              child: const Text("开启"),
            ),
            TextButton(
              onPressed: () {
                stopTimer();
              },
              child: const Text("停止"),
            ),
          ],
        ),
      ),
    );
  }

  //开始
  startTimer() {
    stopTimer();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          count++;
        });
      },
    );
  }

  //结束
  stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      _timer = null;
    }
  }
}
