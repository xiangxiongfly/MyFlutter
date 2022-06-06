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
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text("Wrap"),
              Container(
                child: Wrap(
                  //主轴间距
                  spacing: 8,
                  //纵轴间距
                  runSpacing: 4,
                  //布局方向
                  direction: Axis.horizontal,
                  children: List.generate(
                    13,
                    (index) {
                      double w = 50.0 + 10 * index;
                      return Container(
                        width: w,
                        height: 50,
                        color: Colors.red,
                        alignment: Alignment.center,
                        child: Text("$index"),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text("Flow"),
              Flow(
                delegate: MyFlowDelegate(margin: const EdgeInsets.all(10)),
                children: List.generate(
                  13,
                  (index) {
                    double w = 50.0 + 10 * index;
                    return Container(
                      width: w,
                      height: 50,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: Text("$index"),
                    );
                  },
                ),
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
    return const Size(double.infinity, 200);
  }
}
