import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DataPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("数据存储"),
      ),
      body: Column(
        children: [
          Text("getTemporaryDirectory(): ${getTemporaryDirectory()}"),
          Divider(),
          Text("getApplicationSupportDirectory(): ${getApplicationSupportDirectory()}"),
          Divider(),
          Text("getLibraryDirectory(): ${getLibraryDirectory()}"),
          Divider(),
          Text("getApplicationDocumentsDirectory(): ${getApplicationDocumentsDirectory()}"),
          Divider(),
          Text("getExternalStorageDirectory(): ${getExternalStorageDirectory()}"),
          Divider(),
          Text("getExternalCacheDirectories(): ${getExternalCacheDirectories()}"),
          Divider(),
          Text("getExternalStorageDirectories(): ${getExternalStorageDirectories()}"),
          Divider(),
          Text("getDownloadsDirectory(): ${getDownloadsDirectory()}"),
        ],
      ),
    );
  }
}
