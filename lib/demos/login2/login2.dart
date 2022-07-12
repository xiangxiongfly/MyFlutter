import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myflutter/demos/login2/shake_text_filed.dart';
import 'package:myflutter/utils/snack_bar_utils.dart';
import 'anim_lib/shake_animation_controller.dart';
import 'keyboard_placeholder_widget.dart';

class Login2Page extends StatefulWidget {
  const Login2Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Login2PageState();
  }
}

class _Login2PageState extends State<Login2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //键盘顶起不影响布局
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildBackground(),
            _buildBlur(),
            const LoginInputLayout(),
          ],
        ),
      ),
    );
  }

  /// 背景图片
  Widget _buildBackground() {
    return Positioned.fill(
      child: Image.asset(
        "assets/images/welcome.jpg",
        fit: BoxFit.fill,
      ),
    );
  }

  /// 高斯模糊
  Widget _buildBlur() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Container(
        color: Colors.white.withOpacity(0.06),
      ),
    );
  }
}

class LoginInputLayout extends StatefulWidget {
  const LoginInputLayout({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginInputLayoutState();
}

class _LoginInputLayoutState extends State<LoginInputLayout> {
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ShakeAnimationController _usernameAnimController = ShakeAnimationController();
  final ShakeAnimationController _passwordAnimController = ShakeAnimationController();
  final StreamController<dynamic> _usernameStreamController = StreamController();
  final StreamController<dynamic> _passwordStreamController = StreamController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameStreamController.close();
    _passwordStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hideKeyboard();
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: _buildLoginWidget(),
        ),
      ),
    );
  }

  Widget _buildLoginWidget() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const KeyboardPlaceholderWidget(
            minHeight: 170,
            maxHeight: 200,
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildUsernameWidget(),
                const SizedBox(height: 20),
                _buildPasswordWidget(),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    child: const Text("登陆"),
                    onPressed: () {
                      checkLoginFunction();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建用户名输入框
  Widget _buildUsernameWidget() {
    return ShakeTextFiled(
      labelText: "用户名",
      stream: _usernameStreamController.stream,
      shakeAnimationController: _usernameAnimController,
      textFieldController: _usernameController,
      focusNode: _usernameFocusNode,
      onSubmitted: (String value) {
        if (checkUsername()) {
          _usernameFocusNode.unfocus();
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        } else {
          FocusScope.of(context).requestFocus(_usernameFocusNode);
        }
      },
    );
  }

  /// 检查输入框信息
  bool checkUsername() {
    String username = _usernameController.text;
    if (username.isEmpty) {
      _usernameStreamController.add("请输入用户名");
      _usernameAnimController.start();
      return false;
    } else {
      _usernameStreamController.add(null);
      return true;
    }
  }

  /// 构建密码输入框
  Widget _buildPasswordWidget() {
    return ShakeTextFiled(
      labelText: "密码",
      stream: _passwordStreamController.stream,
      shakeAnimationController: _passwordAnimController,
      focusNode: _passwordFocusNode,
      textFieldController: _passwordController,
      onSubmitted: (String value) {
        if (checkPassword()) {
          doLogin();
        } else {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        }
      },
    );
  }

  /// 检查密码框信息
  bool checkPassword() {
    String password = _passwordController.text;
    if (password.length < 6) {
      _passwordStreamController.add("请输入正确的密码");
      _passwordAnimController.start();
      return false;
    } else {
      _passwordStreamController.add(null);
      return true;
    }
  }

  /// 隐藏键盘
  hideKeyboard() {
    _usernameFocusNode.unfocus();
    _passwordFocusNode.unfocus();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  /// 检查登陆
  checkLoginFunction() {
    hideKeyboard();
    if (checkUsername() && checkPassword()) {
      doLogin();
    }
  }

  doLogin() {
    showSnackBar(context, "登陆成功");
  }
}
