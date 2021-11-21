import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StoragePageState();
  }
}

class _StoragePageState extends State<StoragePage> {
  // Future<Directory>? _tempDirectory;
  // Future<Directory>? _appSupportDirectory;
  // Future<Directory>? _libraryDirectory;
  // Future<Directory>? _appDocumentsDirectory;
  // Future<Directory>? _externalStorageDirectory;
  // Future<List<Directory>>? _externalCacheDirectories;
  // Future<List<Directory>>? _externalStorageDirectories;
  // Future<Directory>? _downloadsDirectory;

  @override
  void initState() {
    super.initState();
    // _tempDirectory = getTemporaryDirectory();
    // _appSupportDirectory = getApplicationSupportDirectory();
    // _libraryDirectory = getLibraryDirectory();
    // _appDocumentsDirectory = getApplicationDocumentsDirectory();
    // _externalStorageDirectory = getExternalStorageDirectory();
    // _externalCacheDirectories = getExternalCacheDirectories();
    // _externalStorageDirectories = getExternalStorageDirectories();
    // _downloadsDirectory = getDownloadsDirectory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("数据存储"),
      ),
      body: Column(
        children: [
          // FutureBuilder(builder: ),
        ],
      ),
    );
  }
}
