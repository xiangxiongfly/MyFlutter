import 'package:flutter/material.dart';

import 'gesture_detector_route.dart';
import 'inkwell_route.dart';
import 'listener_route.dart';

class GestureDetectorTypePage extends StatelessWidget {
  const GestureDetectorTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势组件"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("手势监听"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return GestureDetectorPage();
                  }),
                );
              },
            ),
            ElevatedButton(
              child: Text("InkWell水波纹效果"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return InkWellPage();
                  }),
                );
              },
            ),
            ElevatedButton(
              child: Text("Listener"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return ListenerPage();
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
