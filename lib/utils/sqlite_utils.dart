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
    String path = join(directory.path, "dbName");
    return await openDatabase(
      path,
      version: 1,
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
    var _db = await db;
    return await _db?.insert("Student", student.toJson());
  }

  /// 使用SQL保存数据
  Future saveDataBySQL(Student student) async {
    const String sql = """
    INSERT INTO Student(name,age,sex) values(?,?,?)
    """;
    var _db = await db;
    return await _db?.rawInsert(sql, [student.name, student.age, student.sex]);
  }

  /// 查询全部数据
  Future<List<Student>?> findAll() async {
    var _db = await db;
    List<Map<String, Object?>>? result = await _db?.query("Student");
    if (result == null) {
      return null;
    } else {
      if (result.isNotEmpty) {
        return result.map((e) => Student.fromJson(e)).toList();
      } else {
        return [];
      }
    }
  }

  ///条件查询
  Future<List<Student>?> find(int sex) async {
    var _db = await db;
    List<Map<String, dynamic>>? result = await _db?.query("Student", where: "sex=?", whereArgs: [sex]);
    if (result == null) {
      return null;
    } else {
      if (result.isNotEmpty) {
        return result.map((e) => Student.fromJson(e)).toList();
      } else {
        return [];
      }
    }
  }

  /// 修改
  Future<int> update(Student student) async {
    var _db = await db;
    student.age = 99;
    int? count = await _db?.update("Student", student.toJson(), where: "id=?", whereArgs: [student.id]);
    return count ?? 0;
  }

  /// 删除
  Future<int> delete(int id) async {
    var _db = await db;
    int? count = await _db?.delete("Student", where: "id=?", whereArgs: [id]);
    return count ?? 0;
  }

  /// 删除全部
  Future<int> deleteAll() async {
    var _db = await db;
    int? count = await _db?.delete("Student");
    return count ?? 0;
  }
}
