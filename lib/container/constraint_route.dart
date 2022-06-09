import 'package:flutter/material.dart';

class ConstraintPage extends StatelessWidget {
  const ConstraintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("约束容器组件")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
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
              const SizedBox(height: 10),
              SizedBox(
                width: 50,
                height: 50,
                child: Container(color: Colors.green),
              ),
              const SizedBox(height: 10),
              SizedBox.fromSize(
                size: const Size(50, 50),
                child: Container(color: Colors.green),
              ),
              const SizedBox(height: 100),
              SizedBox(
                width: 10,
                height: 10,
                child: UnconstrainedBox(
                  child: Container(width: 100, height: 100, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
