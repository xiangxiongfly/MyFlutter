import 'package:flutter/material.dart';

class SizedBoxPage extends StatelessWidget {
  const SizedBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SizedBox"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60,
                width: 150,
                child: Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text("hello world"),
                ),
              ),
              SizedBox(height: 30),
              SizedBox.fromSize(
                size: Size(150, 60),
                child: Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text("hello flutter"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
