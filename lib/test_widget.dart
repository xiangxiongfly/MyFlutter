import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个页面"),
      ),
      body: Column(
        children: [
          Text("getTemporaryDirectory(): ${getTemporaryDirectory()}"),
          Divider(),
          Text(
              "getApplicationSupportDirectory(): ${getApplicationSupportDirectory()}"),
          Divider(),
          Text("getLibraryDirectory(): ${getLibraryDirectory()}"),
          Divider(),
          Text(
              "getApplicationDocumentsDirectory(): ${getApplicationDocumentsDirectory()}"),
          Divider(),
          Text(
              "getExternalStorageDirectory(): ${getExternalStorageDirectory()}"),
          Divider(),
          Text(
              "getExternalCacheDirectories(): ${getExternalCacheDirectories()}"),
          Divider(),
          Text(
              "getExternalStorageDirectories(): ${getExternalStorageDirectories()}"),
          Divider(),
          Text("getDownloadsDirectory(): ${getDownloadsDirectory()}"),
        ],
      ),
    );
  }
}

Widget _buildDirectories(
    BuildContext context, AsyncSnapshot<List<Directory>> snapshot) {
  Text text = const Text('');
  if (snapshot.connectionState == ConnectionState.done) {
    if (snapshot.hasError) {
      text = Text('Error: ${snapshot.error}');
    } else if (snapshot.hasData) {
      final String combined =
          snapshot.data!.map((Directory d) => d.path).join(', ');
      text = Text('paths: $combined');
    } else {
      text = const Text('path unavailable');
    }
  }
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16), child: text);
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二个页面"),
      ),
      body: Column(
        children: [
          Text("第二页"),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context, "hello 返回");
            },
            child: Text("返回"),
          )
        ],
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第三个页面"),
      ),
      body: Column(
        children: [
          Text("第三页"),
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
  @override
  State<StatefulWidget> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第四个页面"),
      ),
      body: Column(
        children: [
          Text("第四页"),
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
