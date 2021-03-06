import 'package:flutter/material.dart';

class PaddingMarginPage extends StatelessWidget {
  const PaddingMarginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Padding & Margin")),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text("hello"),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            child: Text("hello"),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text("hello"),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: const Text("hello"),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: const Text("hello"),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            child: const Text("hello"),
          ),
        ],
      ),
    );
  }
}
