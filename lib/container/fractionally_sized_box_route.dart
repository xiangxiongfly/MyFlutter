import 'package:flutter/material.dart';

class FractionallySizedBoxPage extends StatelessWidget {
  const FractionallySizedBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FractionallySizedBox"),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          child: FractionallySizedBox(
            widthFactor: 0.8,
            heightFactor: 0.2,
            child: Container(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
