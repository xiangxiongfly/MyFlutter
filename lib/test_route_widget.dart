import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("第一个页面"),
      ),
      body: Column(
        children: [
          OutlinedButton(
            child: const Text("跳转第二页面"),
            onPressed: () {
              Navigator.pushNamed(context, "second_page");
            },
          ),
          Text("getTemporaryDirectory(): ${getTemporaryDirectory()}"),
          const Divider(),
          Text("getApplicationSupportDirectory(): ${getApplicationSupportDirectory()}"),
          const Divider(),
          Text("getLibraryDirectory(): ${getLibraryDirectory()}"),
          const Divider(),
          Text("getApplicationDocumentsDirectory(): ${getApplicationDocumentsDirectory()}"),
          const Divider(),
          Text("getExternalStorageDirectory(): ${getExternalStorageDirectory()}"),
          const Divider(),
          Text("getExternalCacheDirectories(): ${getExternalCacheDirectories()}"),
          const Divider(),
          Text("getExternalStorageDirectories(): ${getExternalStorageDirectories()}"),
          const Divider(),
          Text("getDownloadsDirectory(): ${getDownloadsDirectory()}"),
        ],
      ),
    );
  }
}

Widget _buildDirectories(BuildContext context, AsyncSnapshot<List<Directory>> snapshot) {
  Text text = const Text('');
  if (snapshot.connectionState == ConnectionState.done) {
    if (snapshot.hasError) {
      text = Text('Error: ${snapshot.error}');
    } else if (snapshot.hasData) {
      final String combined = snapshot.data!.map((Directory d) => d.path).join(', ');
      text = Text('paths: $combined');
    } else {
      text = const Text('path unavailable');
    }
  }
  return Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: text);
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("第二个页面"),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {
              Navigator.pop(context, "hello 返回");
            },
            child: const Text("返回"),
          )
        ],
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("第三个页面"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: const Text("跳转"),
          ),
        ],
      ),
    );
  }
}

class FourthPage extends StatefulWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("第四个页面"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("跳转"),
          ),
        ],
      ),
    );
  }
}
