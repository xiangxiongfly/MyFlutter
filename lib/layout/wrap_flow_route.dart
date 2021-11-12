import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapFlowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("流式布局组件"),
      ),
      body: Column(
        children: [
          Wrap(
            //主轴间距
            spacing: 8,
            //纵轴间距
            runSpacing: 2,
            alignment: WrapAlignment.start,
            children: [
              Chip(
                label: Text("ABC"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text("A"),
                ),
              ),
              Chip(
                label: Text("EFG"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text("E"),
                ),
              ),
              Chip(
                label: Text("HIK"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text("H"),
                ),
              ),
              Chip(
                label: Text("LMN"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text("L"),
                ),
              ),
              Chip(
                label: Text("OPQ"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text("O"),
                ),
              )
            ],
          ),
          Flow(
            delegate: MyFlowDelegate(margin: EdgeInsets.all(10)),
            children: [
              Container(width: 80, height: 80, color: Colors.red),
              Container(width: 80, height: 80, color: Colors.green),
              Container(width: 80, height: 80, color: Colors.blue),
              Container(width: 80, height: 80, color: Colors.red),
              Container(width: 80, height: 80, color: Colors.green),
              Container(width: 80, height: 80, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }
}

class MyFlowDelegate extends FlowDelegate {
  EdgeInsets margin;
  double width = 0;
  double height = 0;

  MyFlowDelegate({this.margin = EdgeInsets.zero});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var width = context.getChildSize(i)!.width + x + margin.right;
      if (width < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x = width + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return this != oldDelegate;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(double.infinity, 200);
  }
}
