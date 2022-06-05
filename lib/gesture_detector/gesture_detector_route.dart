import 'package:flutter/material.dart';

class GestureDetectorPage extends StatelessWidget {
  const GestureDetectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("点击组件"),
      ),
      body: GestureDetector(
        onTapDown: (TapDownDetails details) {
          print("按下");
        },
        onTapUp: (TapUpDetails details) {
          print("抬起");
        },
        onTapCancel: () {
          print("点击取消");
        },
        onTap: () {
          print("点击");
        },
        onDoubleTap: () {
          print("双击");
        },

        // onLongPressStart: (LongPressStartDetails details) {
        //   print("长按开始");
        // },
        // onLongPress: () {
        //   print("长按回调");
        // },
        // onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) {
        //   print("长按移动");
        // },
        // onLongPressUp: () {
        //   print("长按抬起");
        // },
        // onLongPressEnd: (LongPressEndDetails details) {
        //   print("长按结束");
        // },

        // onVerticalDragDown: (DragDownDetails details) {
        //   print("垂直拖动按下");
        // },
        // onVerticalDragStart: (DragStartDetails details) {
        //   print("垂直拖动开始");
        // },
        // onVerticalDragUpdate: (DragUpdateDetails details) {
        //   print("垂直拖动移动");
        // },
        // onVerticalDragCancel: () {
        //   print("垂直拖动取消");
        // },
        // onVerticalDragEnd: (DragEndDetails details) {
        //   print("垂直拖动结束");
        // },

        // onScaleStart: (ScaleStartDetails details) {
        //   print("缩放开始");
        // },
        // onScaleUpdate: (ScaleUpdateDetails details) {
        //   print("缩放更新中");
        // },
        // onScaleEnd: (ScaleEndDetails details) {
        //   print("缩放结束");
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
