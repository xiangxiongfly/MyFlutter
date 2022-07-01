import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureRecognizerPage extends StatefulWidget {
  const GestureRecognizerPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GestureRecognizerPageState();
  }
}

class _GestureRecognizerPageState extends State<GestureRecognizerPage> {
  final _tapGestureRecognizer = TapGestureRecognizer();
  var _textColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer.onTapDown = (TapDownDetails details) {
      setState(() {
        _textColor = Colors.blue;
      });
    };
    _tapGestureRecognizer.onTapUp = (TapUpDetails details) {
      setState(() {
        _textColor = Colors.black;
      });
    };
  }

  @override
  void dispose() {
    super.dispose();
    _tapGestureRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GestureRecognizer"),
      ),
      body: Center(
        child: Text.rich(
          TextSpan(children: [
            TextSpan(
              text: "hello world",
              recognizer: _tapGestureRecognizer,
              style: TextStyle(color: _textColor),
            ),
          ]),
        ),
      ),
    );
  }
}
