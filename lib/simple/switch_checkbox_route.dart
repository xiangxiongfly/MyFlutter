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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("单选复选组件"),
      ),
      body: Column(
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

          //Checkbox携带文字
          Container(
            width: 130,
            child: CheckboxListTile(
              title: const Text("hello"),
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
          ),
        ],
      ),
    );
  }
}
