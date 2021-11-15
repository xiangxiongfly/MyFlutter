import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100,
                height: 50,
                color: Colors.blue,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text("hello world"),
              ),
              Container(
                child: Text("hello Container"),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                clipBehavior: Clip.antiAlias,
                //设置边框背景装饰
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.red.shade50,
                  border: Border.all(
                    color: Colors.red.shade900,
                    width: 2,
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "images/avatar.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.red.shade900,
                    width: 2,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(50),
                constraints: BoxConstraints.tightFor(width: 200, height: 150),
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [Colors.blue.shade800, Colors.blue.shade200],
                    center: Alignment.center,
                    radius: 0.5,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
                transform: Matrix4.rotationZ(0.2),
                transformAlignment: Alignment.center,
                alignment: Alignment.center,
                child: Text("hello world"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
