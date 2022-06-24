import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Container组件"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 100,
                height: 50,
                color: Colors.blue,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: const Text("hello world"),
              ),
              Container(
                child: const Text("hello Container"),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                clipBehavior: Clip.antiAlias,
                //设置边框背景装饰
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.red.shade50,
                  border: Border.all(
                    color: Colors.red.shade900,
                    width: 2,
                  ),
                ),
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("images/avatar.jpg"),
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
                margin: const EdgeInsets.all(50),
                constraints: const BoxConstraints.tightFor(width: 200, height: 150),
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
                child: const Text("hello world"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
