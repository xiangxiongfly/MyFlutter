import 'package:flutter/material.dart';

class GestureDetectorPage extends StatelessWidget {
  const GestureDetectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GestureDetector"),
      ),
      body: GestureDetector(
        // onTapDown: (TapDownDetails details) {
        //   print("onTapDown");
        // },
        // onTapUp: (TapUpDetails details) {
        //   print("onTapUp");
        // },
        // onTapCancel: () {
        //   print("onTapCancel");
        // },
        // onTap: () {
        //   print("onTap");
        // },
        // onDoubleTap: () {
        //   print("onDoubleTap");
        // },

        // onLongPressStart: (LongPressStartDetails details) {
        //   print("onLongPressStart");
        // },
        // onLongPress: () {
        //   print("onLongPress");
        // },
        // onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) {
        //   print("onLongPressMoveUpdate");
        // },
        // onLongPressUp: () {
        //   print("onLongPressUp");
        // },
        // onLongPressEnd: (LongPressEndDetails details) {
        //   print("onLongPressEnd");
        // },

        onVerticalDragDown: (DragDownDetails details) {
          // print("onVerticalDragDown");
        },
        onVerticalDragStart: (DragStartDetails details) {
          // print("onVerticalDragStart");
        },
        onVerticalDragUpdate: (DragUpdateDetails details) {
          // print("onVerticalDragUpdate");
        },
        onVerticalDragCancel: () {
          // print("onVerticalDragCancel");
        },
        onVerticalDragEnd: (DragEndDetails details) {
          // print("onVerticalDragEnd");
        },

        // onScaleStart: (ScaleStartDetails details) {
        //   print("onScaleStart");
        // },
        // onScaleUpdate: (ScaleUpdateDetails details) {
        //   print("onScaleUpdate");
        // },
        // onScaleEnd: (ScaleEndDetails details) {
        //   print("onScaleEnd");
        // },

        child: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
