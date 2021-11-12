import 'package:flutter/material.dart';

class SwitchCheckBoxPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwitchCheckBoxPageState();
  }
}

class _SwitchCheckBoxPageState extends State<SwitchCheckBoxPage> {
  bool _switchSelected = false;
  bool _checkboxSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片组件"),
      ),
      body: Column(
        children: [
          Switch(
            value: _switchSelected,
            onChanged: (value) {
              setState(() {
                _switchSelected = value;
              });
            },
          ),
          Checkbox(
            value: _checkboxSelected,
            activeColor: Colors.red,
            checkColor: Colors.white,
            onChanged: (value) {
              setState(() {
                _checkboxSelected = value ?? false;
              });
            },
          ),
        ],
      ),
    );
  }
}
