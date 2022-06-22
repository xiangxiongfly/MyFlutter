import 'package:flutter/material.dart';

class ClipPage extends StatelessWidget {
  const ClipPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset("images/avatar.jpg", width: 100, height: 100);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clip剪裁组件"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("原图"),
                avatar,
                const SizedBox(height: 10),
                const Text("ClipRect"),
                ClipRect(
                  child: Align(
                    child: avatar,
                    alignment: Alignment.topCenter,
                    heightFactor: 0.5,
                  ),
                ),
                const SizedBox(height: 10),
                const Text("ClipOval"),
                ClipOval(
                  child: avatar,
                  clipBehavior: Clip.antiAlias, //抗锯齿，通常用于处理圆形和弧形
                ),
                const SizedBox(height: 10),
                const Text("ClipRRect"),
                ClipRRect(
                  child: avatar,
                  borderRadius: BorderRadius.circular(10),
                ),
                const SizedBox(height: 10),
                const Text("ClipPath"),
                ClipPath.shape(
                  shape: const StadiumBorder(),
                  child: SizedBox(
                    width: 100,
                    height: 60,
                    child: Image.asset("images/avatar.jpg", fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 10),
                const Text("自定义剪裁1"),
                Container(
                  color: Colors.red,
                  child: ClipRect(
                    clipper: MyClipper1(),
                    child: avatar,
                  ),
                ),
                const SizedBox(height: 10),
                const Text("自定义剪裁2"),
                Container(
                  color: Colors.green,
                  child: ClipPath(
                    clipper: TrianglePath(),
                    child: avatar,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyClipper1 extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return const Rect.fromLTWH(0, 0, 30, 30);
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
