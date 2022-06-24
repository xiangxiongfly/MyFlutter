import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SegmentedControlPage extends StatefulWidget {
  const SegmentedControlPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SegmentedControlPageState();
  }
}

class _SegmentedControlPageState extends State<SegmentedControlPage> {
  String? _value = "语文";
  String? _value2 = "数学";
  String? _value3 = "语文";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("分段控制组件"),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoSegmentedControl(
                children: {
                  "语文": Container(
                    child: const Text("语文"),
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                  "数学": Container(
                    child: const Text("数学"),
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                  "外语": Container(
                    child: const Text("外语"),
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                },
                //默认选中
                groupValue: _value,
                onValueChanged: (value) {
                  setState(() {
                    _value = value as String?;
                  });
                },
              ),
              const SizedBox(height: 10),
              CupertinoSegmentedControl(
                children: {
                  "语文": Container(
                    child: const Text("语文"),
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                  "数学": Container(
                    child: const Text("数学"),
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                  "外语": Container(
                    child: const Text("外语"),
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                },
                //选中（选中的背景颜色，未选中的文字颜色）
                selectedColor: Colors.red,
                //未选中（未选中的背景颜色，选中的文字颜色）
                unselectedColor: Colors.white,
                //按下
                pressedColor: Colors.red[50],
                //边框颜色
                borderColor: Colors.black,
                groupValue: _value2,
                onValueChanged: (value) {
                  setState(() {
                    _value2 = value as String?;
                  });
                },
              ),
              const SizedBox(height: 10),
              CupertinoSlidingSegmentedControl(
                children: {
                  '语文': Container(
                    child: const Text('语文'),
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                  '数学': Container(
                    child: const Text('数学'),
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                  '体育': Container(
                    child: const Text('体育'),
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  )
                },
                groupValue: _value3,
                onValueChanged: (value) {
                  setState(() {
                    _value3 = value as String?;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
