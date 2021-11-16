import 'package:flutter/material.dart';

class SingleChildScrollViewPage extends StatelessWidget {
  const SingleChildScrollViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SingleChildScrollView"),
      ),
      body: MyScrollView(),
    );
  }
}

class MyScrollView extends StatelessWidget {
  String str = "QWERTYUIOPASDFGHJKLZXCVBNM";

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(10),
          child: Column(
            children:
                str.split("").map((e) => Text(e, textScaleFactor: 2)).toList(),
          ),
        ),
      ),
    );
  }
}
