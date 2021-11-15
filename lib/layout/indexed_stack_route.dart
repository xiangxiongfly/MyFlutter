import 'package:flutter/material.dart';

class IndexedStackPage extends StatefulWidget {
  const IndexedStackPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IndexedStackPageState();
  }
}

class _IndexedStackPageState extends State<IndexedStackPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("IndexedStack")),
      body: Column(
        children: [
          SizedBox(height: 50),
          buildFrame(),
          SizedBox(height: 50),
          buildSwitch(),
        ],
      ),
    );
  }

  buildFrame() {
    return IndexedStack(
      index: _index,
      children: [
        Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.red,
            alignment: Alignment.center,
            child: Icon(Icons.home, color: Colors.black, size: 60),
          ),
        ),
        Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.green,
            alignment: Alignment.center,
            child: Icon(Icons.people, color: Colors.black, size: 60),
          ),
        ),
        Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Icon(Icons.settings, color: Colors.black, size: 60),
          ),
        ),
      ],
    );
  }

  buildSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _index = 0;
            });
          },
          icon: Icon(Icons.home),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _index = 1;
            });
          },
          icon: Icon(Icons.people),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _index = 2;
            });
          },
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}
