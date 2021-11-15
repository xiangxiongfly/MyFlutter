import 'package:flutter/material.dart';

class AspectRatioPage extends StatelessWidget {
  const AspectRatioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AspectRatio"),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          alignment: Alignment.center,
          color: Colors.red,
          child: AspectRatio(
            aspectRatio: 2 / 1,
            child: Container(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
