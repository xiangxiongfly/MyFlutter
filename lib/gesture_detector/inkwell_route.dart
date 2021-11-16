import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InkWellPage extends StatelessWidget {
  const InkWellPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("InkWell水波纹效果")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {},
              splashColor: Colors.red,
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text("InkWell效果"),
              ),
            ),
            SizedBox(height: 10),
            Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFDE2F21), Color(0xFFEC592F)],
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Text(
                    "Ink效果",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
