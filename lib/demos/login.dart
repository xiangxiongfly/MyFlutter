import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  //账号
  String _accountValue = "";
  late TextEditingController _accountController;

  //密码
  String _pwdValue = "";
  late TextEditingController _pwdController;

  //提交按钮是否可用
  bool submitEnable = false;

  //密码是否显示
  bool obscurePwd = true;

  //loading是否显示
  bool isLoading = false;

  @override
  void dispose() {
    _accountController.dispose();
    _pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _accountController = TextEditingController.fromValue(
      TextEditingValue(
        text: _accountValue,
        selection: TextSelection.fromPosition(TextPosition(offset: _accountValue.length)),
      ),
    );
    _pwdController = TextEditingController.fromValue(
      TextEditingValue(
        text: _pwdValue,
        selection: TextSelection.fromPosition(TextPosition(offset: _pwdValue.length)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("登陆界面"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 70),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue),
            ),
            padding: const EdgeInsets.all(10),
            child: const FlutterLogo(size: 70),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
            child: _buildAccountInput(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
            child: _buildPwdInput(),
          ),
          const SizedBox(height: 30),
          _buildSubmitBtn(),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: _buildPwdAndRegister(),
          ),
        ],
      ),
    );
  }

  Widget _buildPwdAndRegister() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Column(
          children: [
            Row(
              children: const [
                Text(
                  "忘记密码",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                  width: 65,
                  child: VerticalDivider(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "用户注册",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Text.rich(
              TextSpan(
                text: "登陆即代表同意并阅读",
                style: TextStyle(fontSize: 11, color: Color(0xFF999999)),
                children: [
                  TextSpan(
                    text: "服务协议",
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
      ],
    );
  }

  /// 构建账号输入框
  Widget _buildAccountInput() {
    return TextField(
      controller: _accountController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: const Color(0x30CCCCCC),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0x00ff0000)),
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0x00000000)),
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        hintText: "手机号/邮箱",
        suffixIcon: _accountValue.isEmpty
            ? null
            : IconButton(
                onPressed: () {
                  setState(() {
                    _accountValue = "";
                    checkSubmitEnable();
                  });
                },
                icon: const Icon(Icons.clear),
                color: const Color(0xFFcccccc),
                iconSize: 16,
              ),
      ),
      textAlign: TextAlign.center,
      onChanged: (value) {
        _accountValue = value;
        checkSubmitEnable();
      },
    );
  }

  /// 构建密码输入框
  Widget _buildPwdInput() {
    return TextField(
      controller: _pwdController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: const Color(0x30CCCCCC),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0x000ff000)),
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0x00000000)),
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        hintText: "请输入密码",
        suffixIcon: _pwdValue.isEmpty
            ? null
            : IconButton(
                onPressed: () {
                  setState(() {
                    _pwdValue = "";
                    obscurePwd = true;
                    checkSubmitEnable();
                  });
                },
                icon: const Icon(Icons.clear),
                color: const Color(0xFFcccccc),
                iconSize: 16,
              ),
        prefixIcon: _pwdValue.isEmpty
            ? null
            : IconButton(
                onPressed: () {
                  setState(() {
                    obscurePwd = !obscurePwd;
                  });
                },
                icon: obscurePwd ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                color: const Color(0xFFcccccc),
                iconSize: 16,
              ),
      ),
      textAlign: TextAlign.center,
      obscureText: obscurePwd,
      onChanged: (value) {
        setState(() {
          _pwdValue = value;
          checkSubmitEnable();
        });
      },
    );
  }

  /// 构建提交按钮
  Widget _buildSubmitBtn() {
    return Center(
      child: MaterialButton(
        padding: EdgeInsets.zero,
        shape: const CircleBorder(side: BorderSide(color: Color(0x00ffffff))),
        color: Colors.blue,
        disabledColor: const Color(0x30cccccc),
        onPressed: submitEnable
            ? () {
                submit(context);
              }
            : null,
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }

  /// 提交按钮是否可用
  checkSubmitEnable() {
    setState(() {
      submitEnable = _accountValue.isNotEmpty && _pwdValue.isNotEmpty;
    });
  }

  /// 提交
  submit(BuildContext context) {
    showLoading(context);
    login(_accountValue, _pwdValue).then((value) {
      if (value) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("登陆成功")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("账户名密码错误")));
      }
      hideLoading(context);
    });
  }

  Future<bool> login(String account, String pwd) async {
    return Future.delayed(const Duration(seconds: 3), () {
      return account == "123456" && pwd == "123456";
    });
  }

  /// 显示loading
  showLoading(context) {
    isLoading = true;
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return _createLoading();
      },
    );
  }

  Widget _createLoading() {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          color: Color(0xFFEBEBF5),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: const CupertinoActivityIndicator(),
      ),
    );
  }

  /// 隐藏loading
  hideLoading(context) {
    if (isLoading) Navigator.of(context).pop();
    isLoading = false;
  }
}
