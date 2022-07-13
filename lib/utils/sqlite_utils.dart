import 'dart:io';

import 'package:myflutter/others/sqlite/Student.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBManager {
  /// 数据库名
  final String _dbName = "dbName";

  /// 数据库版本
  final int _version = 1;

  static final DBManager _instance = DBManager._();

  factory DBManager() {
    return _instance;
  }

  DBManager._();

  static Database? _db;

  Future<Database> get db async {
    // if (_db != null) {
    //   return _db;
    // }
    // _db = await _initDB();
    // return _db;
    return _db ??= await _initDB();
  }

  /// 初始化数据库
  Future<Database> _initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(
      path,
      version: _version,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  /// 创建表
  Future _onCreate(Database db, int version) async {
    const String sql = """
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

  /// 保存数据
  Future saveData(Student student) async {
    Database database = await db;
    return await database.insert("Student", student.toJson());
  }

  /// 使用SQL保存数据
  Future saveDataBySQL(Student student) async {
    const String sql = """
    INSERT INTO Student(name,age,sex) values(?,?,?)
    """;
    Database database = await db;
    return await database.rawInsert(sql, [student.name, student.age, student.sex]);
  }

  /// 查询全部数据
  Future<List<Student>?> findAll() async {
    Database? database = await db;
    List<Map<String, Object?>> result = await database.query("Student");
    if (result.isNotEmpty) {
      return result.map((e) => Student.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  ///条件查询
  Future<List<Student>?> find(int sex) async {
    Database database = await db;
    List<Map<String, Object?>> result =
        await database.query("Student", where: "sex=?", whereArgs: [sex]);
    if (result.isNotEmpty) {
      return result.map((e) => Student.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  /// 修改
  Future<int> update(Student student) async {
    Database database = await db;
    student.age = 99;
    int count =
        await database.update("Student", student.toJson(), where: "id=?", whereArgs: [student.id]);
    return count;
  }

  /// 删除
  Future<int> delete(int id) async {
    Database database = await db;
    int count = await database.delete("Student", where: "id=?", whereArgs: [id]);
    return count;
  }

  /// 删除全部
  Future<int> deleteAll() async {
    Database database = await db;
    int count = await database.delete("Student");
    return count;
  }
}
