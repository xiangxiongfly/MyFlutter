import 'package:flutter/material.dart';

class AlignPage extends StatelessWidget {
  const AlignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("相对定位布局组件"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const Text("居中"),
                Container(
                  color: Colors.grey,
                  width: 100,
                  height: 100,
                  child: const Align(
                    child: Icon(Icons.home, size: 30),
                  ),
                ),
                const SizedBox(height: 10),
                const Text("右下"),
                Container(
                  color: Colors.grey,
                  width: 100,
                  height: 100,
                  child: const Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.home, size: 30),
                  ),
                ),
                const SizedBox(height: 10),
                const Text("居中方式2"),
                Container(
                  color: Colors.grey,
                  width: 100,
                  height: 100,
                  child: const Align(
                    alignment: Alignment(0, 0),
                    child: Icon(Icons.home, size: 30),
                  ),
                ),
                const SizedBox(height: 10),
                const Text("右下方式2"),
                Container(
                  color: Colors.grey,
                  width: 100,
                  height: 100,
                  child: const Align(
                    alignment: Alignment(1, 1),
                    child: Icon(Icons.home, size: 30),
                  ),
                ),
                const SizedBox(height: 10),
                const Text("widthFactor & heightFactor"),
                Container(
                  color: Colors.grey,
                  child: const Align(
                    alignment: Alignment.center,
                    widthFactor: 2,
                    heightFactor: 2,
                    child: Icon(Icons.home, size: 30),
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Center"),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                  child: const Center(child: Text("hello world")),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.green,
                  child: const Center(widthFactor: 2, heightFactor: 2, child: Text("hello world")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
