import 'package:flutter/material.dart';

class StackPage extends StatefulWidget {
  const StackPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StackPageState();
  }
}

class _StackPageState extends State<StackPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("层叠布局组件"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Stack基本使用"),
              SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    Container(width: 200, height: 200, color: Colors.red),
                    Container(width: 150, height: 150, color: Colors.green),
                    Container(width: 100, height: 100, color: Colors.blue),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text("fit属性"),
              SizedBox(
                height: 200,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(width: 200, height: 200, color: Colors.red),
                    Container(width: 150, height: 150, color: Colors.green),
                    Container(width: 100, height: 100, color: Colors.blue),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text("alignment属性"),
              SizedBox(
                height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(width: 200, height: 200, color: Colors.red),
                    Container(width: 150, height: 150, color: Colors.green),
                    Container(width: 100, height: 100, color: Colors.blue),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text("Stack & Positioned"),
              Container(
                color: Colors.grey,
                width: double.infinity,
                height: 400,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(width: 50, height: 50, color: Colors.red),
                    Positioned(
                      width: 50,
                      height: 50,
                      left: 0,
                      top: 0,
                      child: Container(width: 150, height: 150, color: Colors.green),
                    ),
                    Positioned(
                      width: 50,
                      height: 50,
                      right: 0,
                      top: 0,
                      child: Container(color: Colors.blue),
                    ),
                    Positioned(
                      width: 50,
                      height: 50,
                      right: 0,
                      bottom: 0,
                      child: Container(color: Colors.yellow),
                    ),
                    Positioned(
                      width: 50,
                      height: 50,
                      left: 0,
                      bottom: 0,
                      child: Container(color: Colors.pink),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text("IndexedStack"),
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildIndexedStack(),
                    buildBtn(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildIndexedStack() {
    return IndexedStack(
      index: _index,
      children: [
        Container(
          width: 200,
          height: 200,
          color: Colors.red,
          child: const Icon(Icons.home, size: 60),
        ),
        Container(
          width: 200,
          height: 200,
          color: Colors.green,
          child: const Icon(Icons.message, size: 60),
        ),
        Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          child: const Icon(Icons.settings, size: 60),
        ),
      ],
    );
  }

  buildBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () {
            setState(() {
              _index = 0;
            });
          },
          child: const Text("显示第1个"),
        ),
        OutlinedButton(
          onPressed: () {
            setState(() {
              _index = 1;
            });
          },
          child: const Text("显示第2个"),
        ),
        OutlinedButton(
          onPressed: () {
            setState(() {
              _index = 2;
            });
          },
          child: const Text("显示第3个"),
        ),
      ],
    );
  }
}
