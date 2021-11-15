import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapFlowPage extends StatelessWidget {
  const WrapFlowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("流式布局组件"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 500,
                child: Wrap(
                  //主轴间距
                  spacing: 8,
                  //纵轴间距
                  runSpacing: 4,
                  //布局方向
                  direction: Axis.horizontal,
                  //主轴对齐方式
                  // alignment: WrapAlignment.start,
                  //纵轴对齐方式
                  // crossAxisAlignment: WrapCrossAlignment.end,
                  //纵轴方向 每一行对齐方式
                  // runAlignment: WrapAlignment.end,
                  children: List.generate(
                    13,
                    (index) {
                      double w = 50.0 + 5 * index;
                      double h = 50.0 + 5 * index;
                      return Container(
                        width: w,
                        height: h,
                        color: Colors.red,
                        alignment: Alignment.center,
                        child: Text("$index"),
                      );
                    },
                  ),
                ),
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
        ),
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
