import 'package:flutter/material.dart';

class ProgressButtonPage extends StatefulWidget {
  const ProgressButtonPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProgressButtonPageState();
  }
}

class _ProgressButtonPageState extends State<ProgressButtonPage> {
  late ButtonStatus _buttonStatus;

  @override
  void initState() {
    _buttonStatus = ButtonStatus.none;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("进度条按钮"),
      ),
      body: Center(
        child: MaterialButton(
          color: Colors.blue,
          minWidth: 240,
          height: 48,
          child: _buildChild(),
          onPressed: () {
            setState(() {
              _buttonStatus = ButtonStatus.loading;
              Future.delayed(const Duration(seconds: 2), () {
                setState(() {
                  _buttonStatus = ButtonStatus.done;
                });
              });
            });
          },
        ),
      ),
    );
  }

  Widget? _buildChild() {
    if (_buttonStatus == ButtonStatus.none) {
      return const Text(
        "登 陆",
        style: TextStyle(color: Colors.white, fontSize: 18),
      );
    } else if (_buttonStatus == ButtonStatus.loading) {
      return const CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 2,
      );
    } else if (_buttonStatus == ButtonStatus.done) {
      return const Icon(
        Icons.check,
        color: Colors.white,
      );
    }
    return null;
  }
}

enum ButtonStatus { none, loading, done }
