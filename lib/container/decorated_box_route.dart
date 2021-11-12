import 'package:flutter/material.dart';

class DecoratedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DecoratedBox")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Text("登陆"),
              ),
              position: DecorationPosition.background,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red.shade800, Colors.red.shade200],
                ),
                borderRadius: BorderRadius.circular(3),
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            DecoratedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Text("登陆"),
              ),
              position: DecorationPosition.background,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.green, Colors.blue],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
