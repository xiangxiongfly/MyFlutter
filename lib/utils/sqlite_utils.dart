import 'dart:io';

import 'package:myflutter/others/sqlite/Student.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBManager {
  static final DBManager _instance = DBManager._internal();

  factory DBManager() {
    return _instance;
  }

  DBManager._internal();

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await _initDB();
    return _db;
  }

  Future<Database> _initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "dbName");
    return await openDatabase(
      path,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  /// 创建表
  Future _onCreate(Database db, int version) async {
    String sql = """
    CREATE TABLE Student(
      id INTEGER primary key AUTOINCREMENT,
      name TEXT,
      age INTEGER,
      sex INTEGER
    )
    """;
    return await db.execute(sql);
  }

  /// 更新表
  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {}

  /// 增
  Future saveData(Student student) async {
    var _db = await db;
    return await _db?.insert("User", student.toJson());
  }
}
