import 'package:flutter/material.dart';

class ConstraintPage extends StatelessWidget {
  const ConstraintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("尺寸限制类容器组件")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text("ConstrainedBox"),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 50,
                      minHeight: 50,
                      maxHeight: 100,
                      maxWidth: 100,
                    ),
                    child: Container(
                      width: 10,
                      height: 10,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text("ConstrainedBox"),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 50,
                      minHeight: 50,
                      maxHeight: 100,
                      maxWidth: 100,
                    ),
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text("SizedBox"),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Container(color: Colors.green),
                  ),
                  const SizedBox(height: 10),
                  const Text("SizedBox"),
                  SizedBox.fromSize(
                    size: const Size(50, 50),
                    child: Container(color: Colors.green),
                  ),
                  const SizedBox(height: 100),
                  const Text("UnconstrainedBox"),
                  SizedBox(
                    width: 10,
                    height: 10,
                    child: UnconstrainedBox(
                      child: Container(width: 100, height: 100, color: Colors.blue),
                    ),
                  ),
                  const SizedBox(height: 100),
                  const Text("AspectRatio"),
                  Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: AspectRatio(
                      aspectRatio: 2 / 1,
                      child: Container(color: Colors.blue),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text("FractionallySizedBox"),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      heightFactor: 0.5,
                      child: Container(color: Colors.red),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
