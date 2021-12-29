import 'package:flutter/material.dart';

class ClipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset("images/avatar.jpg", width: 60, height: 60);
    return Scaffold(
      appBar: AppBar(
        title: Text("Clip系列组件"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("原图"),
              avatar,
              SizedBox(height: 10),
              Text("ClipOval"),
              ClipOval(
                child: avatar,
              ),
              SizedBox(height: 10),
              Text("ClipRect"),
              ClipRect(
                child: avatar,
              ),
              SizedBox(height: 10),
              Text("ClipRRect"),
              ClipRRect(
                child: avatar,
                borderRadius: BorderRadius.circular(10),
              ),
              SizedBox(height: 10),
              Text("ClipPath"),
              ClipPath.shape(
                shape: StadiumBorder(),
                child: Container(
                  width: 100,
                  height: 60,
                  child: Image.asset("images/avatar.jpg", fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 10),
              Text("自定义1"),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: ClipRect(
                  clipper: MyClipper1(),
                  child: avatar,
                ),
              ),
              SizedBox(height: 10),
              Text("自定义2"),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.green),
                child: ClipPath(
                  clipper: TrianglePath(),
                  child: avatar,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper1 extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, 30, 30);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}

class TrianglePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
