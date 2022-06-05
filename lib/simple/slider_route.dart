import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SliderPageState();
  }
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 0;
  double _sliderValue2 = 0;
  RangeValues _rangeValues = const RangeValues(0, 0);
  double _iosSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider组件"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Slider1: $_sliderValue"),
            Slider(
              value: _sliderValue,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            const SizedBox(height: 10),
            Slider(
              //标签
              label: "值：$_sliderValue2",
              //最小值
              min: 0,
              //最大值
              max: 100,
              //离散值
              divisions: 10,
              //已滑动颜色
              activeColor: Colors.red,
              //未滑动颜色
              inactiveColor: Colors.grey,
              //滑块颜色
              thumbColor: Colors.blue,
              value: _sliderValue2,
              onChanged: (value) {
                print("Slider值：$value");
                setState(() {
                  _sliderValue2 = value;
                });
              },
            ),
            const SizedBox(height: 10),
            RangeSlider(
              values: _rangeValues,
              labels:
                  RangeLabels("${_rangeValues.start}", "${_rangeValues.end}"),
              min: 0,
              max: 100,
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  _rangeValues = value;
                });
              },
            ),
            const SizedBox(height: 10),
            CupertinoSlider(
              value: _iosSliderValue,
              onChanged: (value) {
                setState(() {
                  _iosSliderValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
