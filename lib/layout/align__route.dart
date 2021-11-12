import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("对齐相对布局组件"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                color: Colors.grey,
                child: Align(
                  widthFactor: 2,
                  heightFactor: 2,
                  alignment: Alignment(0, 0),
                  child: Icon(
                    Icons.home,
                    size: 60,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                color: Colors.grey,
                child: Align(
                  widthFactor: 2,
                  heightFactor: 2,
                  alignment: Alignment(-1, -1),
                  child: Icon(
                    Icons.home,
                    size: 60,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                color: Colors.grey,
                child: Align(
                  widthFactor: 2,
                  heightFactor: 2,
                  alignment: Alignment(1, 1),
                  child: Icon(
                    Icons.home,
                    size: 60,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(50),
              child: Container(
                color: Colors.grey,
                child: Align(
                  widthFactor: 2,
                  heightFactor: 2,
                  alignment: Alignment(2, 2),
                  child: Icon(
                    Icons.home,
                    size: 60,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(50),
              child: Container(
                color: Colors.grey,
                child: Align(
                  widthFactor: 2,
                  heightFactor: 2,
                  alignment: FractionalOffset(0.5, 0.5),
                  child: Icon(
                    Icons.home,
                    size: 60,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
