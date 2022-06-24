import 'package:flutter/material.dart';

class ListenerPage extends StatelessWidget {
  const ListenerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Listener")),
      body: Center(
        child: Listener(
          onPointerDown: (PointerDownEvent event) {
            print("按下");
          },
          onPointerMove: (PointerMoveEvent event) {
            print("移动");
          },
          onPointerUp: (PointerUpEvent event) {
            print("抬起");
          },
          onPointerCancel: (PointerCancelEvent event) {
            print("取消");
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
