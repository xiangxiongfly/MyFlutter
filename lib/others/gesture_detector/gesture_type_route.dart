import 'package:flutter/material.dart';

import 'gesture_detector_route.dart';
import 'gesture_recognizer_route.dart';
import 'inkwell_route.dart';
import 'listener_route.dart';

class GestureTypePage extends StatelessWidget {
  const GestureTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("手势事件处理"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text("手势监听组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const GestureDetectorPage();
                  }),
                );
              },
            ),
            ElevatedButton(
              child: const Text("GestureRecognizer"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const GestureRecognizerPage();
                  }),
                );
              },
            ),
            ElevatedButton(
              child: const Text("Listener"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const ListenerPage();
                  }),
                );
              },
            ),
            ElevatedButton(
              child: const Text("InkWell水波纹效果"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const InkWellPage();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
