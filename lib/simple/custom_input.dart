import 'package:flutter/material.dart';

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
        title: Text("自定义"),
      ),
      body: Column(
        children: [
          //使用主题
          Padding(
            padding: EdgeInsets.all(10),
            child: Theme(
              data: Theme.of(context).copyWith(
                hintColor: Colors.green,
                inputDecorationTheme: InputDecorationTheme(
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
            padding: EdgeInsets.all(10),
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
                    borderRadius: BorderRadius.all(Radius.circular(10)),
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
        ],
      ),
    );
  }
}
