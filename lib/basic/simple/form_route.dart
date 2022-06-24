import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FormPageState();
  }
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form组件"),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: () {
          print("监听子组件FormField发生变化了");
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: "用户名：",
                  hintText: "请输入用户名",
                  icon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "用户名不能为空";
                  }
                  return null;
                },
                onSaved: (value) {
                  print("保存用户名：$value");
                },
                textInputAction: TextInputAction.send,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: "密码：",
                  hintText: "请输入密码",
                  icon: Icon(Icons.lock),
                ),
                keyboardType: TextInputType.number,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "密码不能为空";
                  } else if (value.trim().length < 6) {
                    return "密码不能少于6位";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  print("保存密码：$value");
                },
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    ElevatedButton(
                      child: const Text("登陆"),
                      onPressed: () {
                        if ((_formKey.currentState as FormState).validate()) {
                          print("验证成功");
                          String username = _usernameController.value.text;
                          String password = _passwordController.value.text;
                          if (username == "hello" && password == "123456") {
                            print("登陆成功");
                          } else {
                            print("登陆失败");
                          }
                        } else {
                          print("验证失败");
                        }
                      },
                    ),
                    ElevatedButton(
                      child: const Text("保存"),
                      onPressed: () {
                        var _state = _formKey.currentState as FormState;
                        print(_state);
                        if (_state.validate()) {
                          _state.save();
                        }
                      },
                    ),
                    ElevatedButton(
                      child: const Text("重置信息"),
                      onPressed: () {
                        (_formKey.currentState as FormState).reset();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
