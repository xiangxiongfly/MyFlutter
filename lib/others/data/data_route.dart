import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter文件存储"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return const PathProviderDemo();
                }));
              },
              child: const Text("path_provider支持平台"),
            ),
            ElevatedButton(
              onPressed: () {
                createDir();
              },
              child: const Text("创建文件夹"),
            ),
            ElevatedButton(
              onPressed: () {
                queryDir();
              },
              child: const Text("遍历文件夹"),
            ),
            ElevatedButton(
              onPressed: () {
                renameDir();
              },
              child: const Text("重命名文件夹"),
            ),
            ElevatedButton(
              onPressed: () {
                deleteDir();
              },
              child: const Text("删除文件夹"),
            ),
            ElevatedButton(
              onPressed: () {
                createFile();
              },
              child: const Text("创建文件"),
            ),
            ElevatedButton(
              onPressed: () {
                deleteFile();
              },
              child: const Text("删除文件"),
            ),
            ElevatedButton(
              onPressed: () {
                writeFile();
              },
              child: const Text("文件写入数据"),
            ),
            ElevatedButton(
              onPressed: () {
                readFile();
              },
              child: const Text("文件读取数据"),
            ),
            ElevatedButton(
              onPressed: () {
                readAsset(context);
              },
              child: const Text("读取asset文件"),
            ),
          ],
        ),
      ),
    );
  }

  /// 创建文件夹
  createDir() async {
    final parentDir = await getApplicationSupportDirectory();
    String path = "${parentDir.path}${Platform.pathSeparator}hello/a/b/c";
    print("path:$path");
    var dir = Directory(path);
    bool exist = dir.existsSync();
    if (exist) {
      print("文件已存在");
    } else {
      var result = dir.create(recursive: true);
      print("创建$result");
    }
  }

  /// 遍历文件夹中的文件
  queryDir() async {
    final parentDir = await getApplicationSupportDirectory();
    String path = "${parentDir.path}${Platform.pathSeparator}hello";
    Stream<FileSystemEntity> fileList = Directory(path).list(recursive: true);
    fileList.forEach((element) {
      FileSystemEntityType type = FileSystemEntity.typeSync(element.path);
      print("$element 类型：$type");
    });
  }

  /// 重命名文件夹
  renameDir() async {
    final parentDir = await getApplicationSupportDirectory();
    String path = "${parentDir.path}${Platform.pathSeparator}hello";
    var dir = Directory(path);
    var newDir = await dir.rename("${parentDir.path}${Platform.pathSeparator}newhello");
    print(newDir);
  }

  /// 删除文件夹
  deleteDir() async {
    final parentDir = await getApplicationSupportDirectory();
    String path = "${parentDir.path}${Platform.pathSeparator}hello";
    var dir = await Directory(path).delete(recursive: true);
    print(dir);
  }

  /// 创建文件
  createFile() async {
    final parentDir = await getApplicationSupportDirectory();
    String path = "${parentDir.path}${Platform.pathSeparator}mytxt.txt";
    var file = File(path);
    bool exist = file.existsSync();
    if (exist) {
      print("文件已存在");
    } else {
      await file.create();
      print(file);
    }
  }

  /// 删除文件
  deleteFile() async {
    final parentDir = await getApplicationSupportDirectory();
    String path = "${parentDir.path}${Platform.pathSeparator}mytxt.txt";
    var file = File(path);
    file.delete();
  }

  /// 文件写入数据
  writeFile() async {
    final parentDir = await getApplicationSupportDirectory();
    String path = "${parentDir.path}${Platform.pathSeparator}mytxt.txt";
    var file = File(path);
    await file.writeAsString("哈喽 flutter1");
    //追加写入
    await file.writeAsBytes(const Utf8Encoder().convert("\n哈喽 flutter2"), mode: FileMode.writeOnlyAppend);
  }

  /// 文件读取数据
  readFile() async {
    final parentDir = await getApplicationSupportDirectory();
    String path = "${parentDir.path}${Platform.pathSeparator}mytxt.txt";
    var file = File(path);
    List<String> lines = await file.readAsLines();
    for (var e in lines) {
      print(e);
    }
    //读取bytes并转String
    String result = const Utf8Decoder().convert(await file.readAsBytes());
    print("result: $result");
  }

  /// 读取asset文件
  readAsset(BuildContext context) async {
    //方式一
    String jsonStr = await DefaultAssetBundle.of(context).loadString("assets/students.json");
    print("jsonStr: $jsonStr");
    var list = json.decode(jsonStr);
    for (var e in list) {
      print(e);
    }

    //方式二
    String jsonStr2 = await rootBundle.loadString("assets/students.json");
    print("jsonStr2: $jsonStr2");
  }
}

class PathProviderDemo extends StatefulWidget {
  const PathProviderDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PathProviderDemoState();
  }
}

class _PathProviderDemoState extends State<PathProviderDemo> {
  late Future<Directory> _tempDirectory;
  late Future<Directory> _appSupportDirectory;
  late Future<Directory> _appLibraryDirectory;
  late Future<Directory> _appDocumentsDirectory;
  late Future<Directory?> _externalStorageDirectory;
  late Future<List<Directory>?> _externalStorageDirectories;
  late Future<List<Directory>?> _externalCacheDirectories;
  late Future<Directory?> _downloadDirectory;

  @override
  void initState() {
    super.initState();
    setState(() {
      _tempDirectory = getTemporaryDirectory();
      _appSupportDirectory = getApplicationSupportDirectory();
      _appLibraryDirectory = getLibraryDirectory();
      _appDocumentsDirectory = getApplicationDocumentsDirectory();
      _externalStorageDirectory = getExternalStorageDirectory();
      _externalCacheDirectories = getExternalCacheDirectories();
      _externalStorageDirectories = getExternalStorageDirectories();
      _downloadDirectory = getDownloadsDirectory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("path_provider支持平台"),
      ),
      body: ListView(
        children: [
          _buildItem("getTemporaryDirectory", _tempDirectory),
          _buildItem("getApplicationSupportDirectory", _appSupportDirectory),
          _buildItem("getLibraryDirectory", _appLibraryDirectory),
          _buildItem("getApplicationDocumentsDirectory", _appDocumentsDirectory),
          _buildItem("getExternalStorageDirectory", _externalStorageDirectory),
          _buildItem2("getExternalCacheDirectories", _externalCacheDirectories),
          _buildItem2("getExternalStorageDirectories", _externalStorageDirectories),
          _buildItem("getDownloadsDirectory", _downloadDirectory),
        ],
      ),
    );
  }

  Widget _buildItem(String title, Future<Directory?> future) {
    return Column(
      children: [
        Text("$title:"),
        FutureBuilder(future: future, builder: _buildDirectory),
        const Divider(),
      ],
    );
  }

  Widget _buildItem2(String title, Future<List<Directory>?> future) {
    return Column(
      children: [
        Text("$title:"),
        FutureBuilder(future: future, builder: _buildDirectories),
        const Divider(),
      ],
    );
  }

  Widget _buildDirectory(BuildContext context, AsyncSnapshot<Directory?> snapshot) {
    Text text = const Text("");
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = Text("Error: ${snapshot.error}");
      } else if (snapshot.hasData) {
        text = Text("path: ${snapshot.data?.path}");
      } else {
        text = const Text("不支持");
      }
    }
    return text;
  }

  Widget _buildDirectories(BuildContext context, AsyncSnapshot<List<Directory>?> snapshot) {
    Text text = const Text("2");
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = Text("Error: ${snapshot.error}");
      } else if (snapshot.hasData) {
        final String? paths = snapshot.data?.map((Directory d) => d.path).join(",");
        text = Text("paths: $paths");
      } else {
        text = const Text("不支持");
      }
    }
    return text;
  }
}
