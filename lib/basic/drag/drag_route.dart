import 'package:flutter/material.dart';

class DragPage extends StatefulWidget {
  const DragPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DragPageState();
  }
}

class _DragPageState extends State<DragPage> {
  var _dragData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("拖拽组件"),
      ),
      body: Center(
        child: Column(
          children: [
            Draggable(
              axis: Axis.vertical,
              child: Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("hello world"),
              ),
              feedback: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text("ABC"),
              ),
              onDragStarted: () {
                print("开始");
              },
              onDragUpdate: (DragUpdateDetails details) {
                print("拖拽中：$details");
              },
              onDragEnd: (DraggableDetails details) {
                print("拖拽结束：$details");
              },
              onDragCompleted: () {
                print("完成");
              },
              onDraggableCanceled: (Velocity velocity, Offset offset) {
                print("取消：$velocity  $offset");
              },
            ),
            SizedBox(height: 50),
            // DragTarget(
            //   builder: (BuildContext context, List candidateData,
            //       List<dynamic> rejectedData) {
            //     return _dragData == null
            //         ? Container(
            //             height: 100,
            //             width: 100,
            //             alignment: Alignment.center,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //               border: Border.all(color: Colors.red),
            //             ),
            //           )
            //         : Container(
            //             height: 100,
            //             width: 100,
            //             alignment: Alignment.center,
            //             decoration: BoxDecoration(
            //               color: Colors.red,
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             child: Text("hello"),
            //           );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
