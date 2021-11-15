import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹性布局组件"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30,
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 30,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 30,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      color: Colors.red[200],
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30,
                      color: Colors.green[200],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
