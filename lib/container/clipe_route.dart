import 'package:flutter/material.dart';

class ClipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset("images/avatar.jpg", width: 60);
    return Scaffold(
      appBar: AppBar(
        title: Text("Clip"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            avatar,
            SizedBox(height: 10),
            ClipOval(
              child: avatar,
            ),
            SizedBox(height: 10),
            ClipRect(
              child: avatar,
            ),
            SizedBox(height: 10),
            ClipRRect(
              child: avatar,
              borderRadius: BorderRadius.circular(10),
            ),
            SizedBox(height: 10),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: ClipRect(
                clipper: MyClipper(),
                child: avatar,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, 30, 30);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
