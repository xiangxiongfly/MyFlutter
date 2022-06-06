import 'package:flutter/material.dart';

class FlexPage extends StatelessWidget {
  const FlexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("弹性布局组件"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Flexible fit属性"),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
                Flexible(
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Flexible flex属性"),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(height: 50, color: Colors.red),
                ),
                Flexible(
                  flex: 2,
                  child: Container(height: 50, color: Colors.green),
                ),
                Flexible(
                  flex: 3,
                  child: Container(height: 50, color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Expanded"),
            Row(
              children: [
                Container(width: 50, height: 50, color: Colors.red),
                Container(width: 50, height: 50, color: Colors.green),
                Expanded(
                  child: Container(height: 50, color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Spacer"),
            Row(
              children: [
                Container(width: 50, height: 50, color: Colors.red),
                const Spacer(),
                Container(width: 50, height: 50, color: Colors.green),
                const Spacer(),
                Container(width: 50, height: 50, color: Colors.blue),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Flex & Expanded"),
            Flex(
              direction: Axis.horizontal,
              children: [
                Container(width: 50, height: 50, color: Colors.grey),
                Expanded(
                  flex: 1,
                  child: Container(height: 50, color: Colors.red),
                ),
                Expanded(
                  flex: 2,
                  child: Container(height: 50, color: Colors.green),
                ),
                Expanded(
                  flex: 3,
                  child: Container(height: 50, color: Colors.blue),
                ),
                Container(width: 50, height: 50, color: Colors.black12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
