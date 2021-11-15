import 'package:flutter/material.dart';

class SwitchCheckBoxPage extends StatefulWidget {
  const SwitchCheckBoxPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SwitchCheckBoxPageState();
  }
}

class _SwitchCheckBoxPageState extends State<SwitchCheckBoxPage> {
  bool _switchSelected = false;
  bool _checkboxSelected = false;
  var _radioGroupValue = 1;
  double _sliderValue = 0;
  double _sliderValue2 = 0;
  RangeValues _rangeValues = RangeValues(0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("单选复选组件"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Radio
            Row(
              children: [
                Radio<int>(
                  value: 1,
                  //只有当value和groupValue相等时才会选中
                  groupValue: _radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      _radioGroupValue = value!;
                    });
                  },
                ),
                Radio<int>(
                  value: 2,
                  groupValue: _radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      _radioGroupValue = value!;
                    });
                  },
                ),
                Radio<int>(
                  value: 3,
                  groupValue: _radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      _radioGroupValue = value!;
                    });
                  },
                ),
              ],
            ),

            //Radio后面携带文字
            Row(
              children: [
                Flexible(
                  child: RadioListTile<int>(
                    title: Text("语文"),
                    value: 1,
                    //设置选中颜色
                    activeColor: Colors.red,
                    groupValue: _radioGroupValue,
                    onChanged: (value) {
                      setState(() {
                        _radioGroupValue = value!;
                      });
                    },
                  ),
                ),
                Flexible(
                  child: RadioListTile<int>(
                    title: Text("数学"),
                    value: 2,
                    activeColor: Colors.red,
                    groupValue: _radioGroupValue,
                    onChanged: (value) {
                      setState(() {
                        _radioGroupValue = value!;
                      });
                    },
                  ),
                ),
                Flexible(
                  child: RadioListTile<int>(
                    title: Text("外语"),
                    value: 3,
                    activeColor: Colors.red,
                    groupValue: _radioGroupValue,
                    onChanged: (value) {
                      setState(() {
                        _radioGroupValue = value!;
                      });
                    },
                  ),
                ),
              ],
            ),

            //Switch
            Switch(
              value: _switchSelected,
              onChanged: (value) {
                setState(() {
                  _switchSelected = value;
                });
              },
            ),

            //Checkbox
            Checkbox(
              //为true表示选中
              value: _checkboxSelected,
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value!;
                });
              },
            ),

            //Checkbox携带文字
            CheckboxListTile(
              //标题
              title: const Text("标题"),
              //子标题
              subtitle: const Text("子标题"),
              //第二图标
              secondary: const Icon(Icons.switch_right),
              //为true表示选中
              value: _checkboxSelected,
              //选中时矩形区域颜色
              activeColor: Colors.red,
              //对勾颜色
              checkColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value!;
                });
              },
            ),

            //Slider
            Slider(
              value: _sliderValue,
              onChanged: (value) {
                print("Slider值：$value");
                setState(() {
                  _sliderValue = value;
                });
              },
            ),

            //Slider其他设置
            Slider(
              //标签
              label: "值：$_sliderValue2",
              //最小值
              min: 0,
              //最大值
              max: 100,
              //离散值
              divisions: 2,
              //已滑动颜色
              activeColor: Colors.red,
              //未滑动颜色
              inactiveColor: Colors.grey,
              //滑块颜色
              // thumbColor: Colors.blue,
              value: _sliderValue2,
              onChanged: (value) {
                print("Slider值：$value");
                setState(() {
                  _sliderValue2 = value;
                });
              },
            ),

            //RangeSlider
            RangeSlider(
              values: _rangeValues,
              labels:
                  RangeLabels("${_rangeValues.start}", "${_rangeValues.end}"),
              min: 0,
              max: 100,
              divisions: 4,
              onChanged: (value) {
                setState(() {
                  _rangeValues = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
