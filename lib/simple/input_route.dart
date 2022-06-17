import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPage extends StatelessWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("输入框组件"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SimpleTextFieldPage()),
                );
              },
              child: const Text("TextField简单使用"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CustomTextFieldPage()),
                );
              },
              child: const Text("TextField自定义"),
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleTextFieldPage extends StatefulWidget {
  const SimpleTextFieldPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SimpleTextFieldPageState();
  }
}

class _SimpleTextFieldPageState extends State<SimpleTextFieldPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  FocusScopeNode? focusScopeNode;

  @override
  void initState() {
    super.initState();
    //设置默认值
    // _usernameController.text = "你好";
    //设置选择文本
    // _usernameController.selection = TextSelection(baseOffset: 0, extentOffset: _usernameController.text.length);

    //监听内容变化
    _emailController.addListener(() {
      print("内容变化2：${_emailController.text}");
    });

    //监听焦点变化
    focusNode1.addListener(() {
      print("焦点变化：${focusNode1.hasFocus}");
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    focusNode1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextField简单使用"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                focusNode: focusNode1,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                ],
                decoration: const InputDecoration(
                  // labelText: "用户名",
                  // hintText: "请输入用户名(仅允许输入英文字符)",
                  // prefixIcon: Icon(Icons.person),
                ),
                onChanged: (value) {
                  print("内容变化1：$value");
                },
                controller: _usernameController,
                textInputAction: TextInputAction.search,
              ),
              TextField(
                focusNode: focusNode2,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9.]")),
                ],
                decoration: const InputDecoration(
                  labelText: "邮箱",
                  hintText: "请输入邮箱账号",
                  prefixIcon: Icon(Icons.mail),
                ),
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
              ),
              TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码（仅允许输入6位即以上的数字）",
                  prefixIcon: Icon(Icons.lock),
                ),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: "其他",
                  hintText: "请输入其他信息",
                  prefixIcon: Icon(Icons.lock),
                ),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
              RaisedButton(
                child: const Text("移动焦点"),
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
                child: const Text("隐藏键盘"),
                onPressed: () {
                  //所有编辑框失去焦点，就会收起键盘
                  focusNode1.unfocus();
                  focusNode2.unfocus();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldPage extends StatefulWidget {
  const CustomTextFieldPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustomTextFieldPageState();
  }
}

class _CustomTextFieldPageState extends State<CustomTextFieldPage> {
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  bool _hasFocus1 = false;
  bool _hasFocus2 = false;

  @override
  void initState() {
    super.initState();

    focusNode1.addListener(() {
      if (_hasFocus1 != focusNode1.hasFocus) {
        setState(() {
          _hasFocus1 = focusNode1.hasFocus;
        });
      }
    });

    focusNode2.addListener(() {
      if (_hasFocus2 != focusNode2.hasFocus) {
        setState(() {
          _hasFocus2 = focusNode2.hasFocus;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("自定义"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //使用主题
            Padding(
              padding: const EdgeInsets.all(10),
              child: Theme(
                data: Theme.of(context).copyWith(
                  hintColor: Colors.green,
                  inputDecorationTheme: const InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                child: Column(
                  children: const [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "姓名：",
                        hintText: "请输入姓名",
                        prefixIcon: Icon(Icons.people),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "密码：",
                        hintText: "请输入密码",
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),

            //组合
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    child: TextField(
                      focusNode: focusNode1,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        labelText: "姓名",
                        labelStyle: TextStyle(
                          color: _hasFocus1 ? Colors.black : Colors.grey,
                        ),
                        hintText: "请输入姓名",
                        prefixIcon: Icon(
                          Icons.people,
                          color: _hasFocus1 ? Colors.red : Colors.grey,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _hasFocus1 ? Colors.red : Colors.grey,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: TextField(
                      focusNode: focusNode2,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        labelText: "密码",
                        labelStyle: TextStyle(
                          color: _hasFocus2 ? Colors.black : Colors.grey,
                        ),
                        hintText: "请输入密码",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: _hasFocus2 ? Colors.red : Colors.grey,
                        ),
                        border: InputBorder.none,
                      ),
                      obscureText: true,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _hasFocus2 ? Colors.red : Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  fillColor: Color(0x30cccccc),
                  filled: true,
                  hintText: "QQ/邮箱/手机号",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
