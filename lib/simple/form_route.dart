import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormPageState();
  }
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form组件"),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: () {
          print("子组件FormField发生变化了");
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                controller: _userController,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "请输入用户名",
                  icon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value != null) {
                    return value.trim().length > 0 ? null : "用户名不能为空";
                  } else {
                    return "用户名不能为空";
                  }
                },
                onSaved: (value) {
                  print("保存1");
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (value) {
                  if (value != null) {
                    return value.trim().length >= 6 ? null : "密码不能少于6位";
                  } else {
                    return "请输入密码";
                  }
                },
                onSaved: (value) {
                  print("保存2");
                },
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    ElevatedButton(
                      child: Text("登陆"),
                      onPressed: () {
                        if ((_formKey.currentState as FormState).validate()) {
                          print("验证通过");
                        } else {
                          print("验证失败");
                        }
                      },
                    ),
                    ElevatedButton(
                      child: Text("保存"),
                      onPressed: () {
                        (_formKey.currentState as FormState).save();
                      },
                    ),
                    ElevatedButton(
                      child: Text("重置"),
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
