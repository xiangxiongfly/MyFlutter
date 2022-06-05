import 'package:flutter/material.dart';

class SwitchRadioCheckBoxPage extends StatefulWidget {
  const SwitchRadioCheckBoxPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SwitchRadioCheckBoxPageState();
  }
}

class _SwitchRadioCheckBoxPageState extends State<SwitchRadioCheckBoxPage> {
  bool _switchSelected = false;
  bool _checkboxSelected = false;
  int _sportValue = 1;
  int _subjectValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("开关单选复选组件"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text("开关："),
            Switch(
              value: _switchSelected,
              onChanged: (value) {
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
            const Text("单选："),
            Row(
              children: [
                const Text("运动："),
                const Text("篮球"),
                Radio<int>(
                  value: 1,
                  //只有当value和groupValue相等时才会选中
                  groupValue: _sportValue,
                  onChanged: (value) {
                    setState(() {
                      _sportValue = value!;
                    });
                  },
                ),
                const Text("足球"),
                Radio<int>(
                  value: 2,
                  groupValue: _sportValue,
                  onChanged: (value) {
                    setState(() {
                      _sportValue = value!;
                    });
                  },
                ),
                const Text("乒乓球"),
                Radio<int>(
                  value: 3,
                  groupValue: _sportValue,
                  onChanged: (value) {
                    setState(() {
                      _sportValue = value!;
                    });
                  },
                ),
              ],
            ),
            const Text("单选文字："),
            Row(
              children: [
                Flexible(
                  child: RadioListTile<int>(
                    title: Text("语文"),
                    value: 1,
                    //设置选中颜色
                    activeColor: Colors.red,
                    groupValue: _subjectValue,
                    onChanged: (value) {
                      setState(() {
                        _subjectValue = value!;
                      });
                    },
                  ),
                ),
                Flexible(
                  child: RadioListTile<int>(
                    title: Text("数学"),
                    value: 2,
                    activeColor: Colors.red,
                    groupValue: _subjectValue,
                    onChanged: (value) {
                      setState(() {
                        _subjectValue = value!;
                      });
                    },
                  ),
                ),
                Flexible(
                  child: RadioListTile<int>(
                    title: Text("外语"),
                    value: 3,
                    activeColor: Colors.red,
                    groupValue: _subjectValue,
                    onChanged: (value) {
                      setState(() {
                        _subjectValue = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const Text("复选："),
            Row(
              children: [
                const Text("是否选择"),
                Checkbox(
                  //为true表示选中
                  value: _checkboxSelected,
                  onChanged: (value) {
                    setState(() {
                      _checkboxSelected = value!;
                    });
                  },
                )
              ],
            ),
            const Text("复选其他样式："),
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
          ],
        ),
      ),
    );
  }
}
