import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myflutter/simple/custom_input.dart';

class InputPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _InputPageState();
  }
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  FocusScopeNode? focusScopeNode;

  @override
  void initState() {
    super.initState();
    //设置默认值
    _usernameController.text = "你好";
    //设置选择文本
    _usernameController.selection = TextSelection(
        baseOffset: 0, extentOffset: _usernameController.text.length);

    //监听内容变化
    _inputController.addListener(() {
      print("内容变化2：${_inputController.text}");
    });

    //监听焦点变化
    focusNode1.addListener(() {
      print("焦点变化：${focusNode1.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("输入框组件"),
      ),
      body: Column(
        children: [
          TextField(
            autofocus: true,
            focusNode: focusNode1,
            maxLength: 6,
            inputFormatters: [
              WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),
            ],
            decoration: InputDecoration(
              labelText: "用户名",
              hintText: "请输入用户名",
              prefixIcon: Icon(Icons.person),
            ),
            onChanged: (value) {
              print("内容变化1：$value");
            },
            controller: _usernameController,
            textInputAction: TextInputAction.search,
          ),
          TextField(
            autofocus: true,
            focusNode: focusNode2,
            decoration: InputDecoration(
              labelText: "邮箱",
              hintText: "请输入邮箱账号",
              prefixIcon: Icon(Icons.mail),
            ),
            keyboardType: TextInputType.emailAddress,
            controller: _inputController,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "密码",
              hintText: "请输入密码",
              prefixIcon: Icon(Icons.lock),
            ),
            keyboardType: TextInputType.number,
            obscureText: true,
          ),
          Builder(builder: (context) {
            return Column(
              children: [
                RaisedButton(
                  child: Text("移动焦点"),
                  onPressed: () {
                    if (focusScopeNode == null) {
                      focusScopeNode = FocusScope.of(context);
                      focusScopeNode!.requestFocus(focusNode1);
                    } else {
                      // focusScopeNode!.requestFocus(focusNode2);
                      focusScopeNode!.nextFocus();
                    }
                  },
                ),
                RaisedButton(
                  child: Text("隐藏键盘"),
                  onPressed: () {
                    //所有编辑框失去焦点，就会收起键盘
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                ),
                RaisedButton(
                  child: Text("自定义"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return CustomTextFieldPage();
                      }),
                    );
                  },
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
