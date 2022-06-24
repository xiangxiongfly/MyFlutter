import 'package:flutter/material.dart';

class FittedBoxPage extends StatelessWidget {
  const FittedBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FittedBox组件")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Text("原图"),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: const Image(image: AssetImage("images/bird.jpg")),
                ),
                const Text("BoxFit.fill"),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: const FittedBox(
                    fit: BoxFit.fill,
                    child: Image(image: AssetImage("images/bird.jpg")),
                  ),
                ),
                const SizedBox(height: 20),
                const Text("BoxFit.contain"),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: const FittedBox(
                    fit: BoxFit.contain,
                    child: Image(image: AssetImage("images/bird.jpg")),
                  ),
                ),
                const SizedBox(height: 20),
                const Text("BoxFit.cover"),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: const FittedBox(
                    fit: BoxFit.cover,
                    child: Image(image: AssetImage("images/bird.jpg")),
                  ),
                ),
                const SizedBox(height: 20),
                const Text("BoxFit.fitWidth"),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Image(image: AssetImage("images/bird.jpg")),
                  ),
                ),
                const SizedBox(height: 20),
                const Text("BoxFit.fitHeight"),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: const FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Image(image: AssetImage("images/bird.jpg")),
                  ),
                ),
                const SizedBox(height: 20),
                // const Text("BoxFit.none"),
                // Container(
                //   width: 100,
                //   height: 100,
                //   color: Colors.red,
                //   child: const FittedBox(
                //     fit: BoxFit.none,
                //     child: Image(image: AssetImage("images/bird.jpg")),
                //   ),
                // ),
                const SizedBox(height: 20),
                const Text("BoxFit.scaleDown"),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Image(image: AssetImage("images/bird.jpg")),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
