import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myflutter/utils/sqlite_utils.dart';

import '../../utils/snack_bar_utils.dart';
import 'Student.dart';

class SqlitePage extends StatefulWidget {
  const SqlitePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SqlitePageState();
  }
}

class _SqlitePageState extends State<SqlitePage> {
  List<Student>? _studentList;

  loadAllData() async {
    _studentList = await DBManager().findAll();
    setState(() {});
  }

  loadData() async {
    _studentList = await DBManager().find(1);
    setState(() {});
  }

  updateData(Student student) async {
    var count = await DBManager().update(student);
    if (count > 0) {
      showSnackBar(context, "修改成功");
    } else {
      showSnackBar(context, "修改失败");
    }
  }

  deleteData(int id) async {
    var count = await DBManager().delete(id);
    if (count > 0) {
      showSnackBar(context, "删除成功");
    } else {
      showSnackBar(context, "删除失败");
    }
  }

  deleteAllData() async {
    var count = await DBManager().deleteAll();
    if (count > 0) {
      showSnackBar(context, "删除成功");
    } else {
      showSnackBar(context, "删除失败");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQLite"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AddStudentPage();
              }));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  loadAllData();
                },
                child: const Text("查询所有数据"),
              ),
              ElevatedButton(
                onPressed: () {
                  loadData();
                },
                child: const Text("条件查询"),
              ),
              ElevatedButton(
                onPressed: () {
                  deleteAllData();
                },
                child: const Text("删除全部"),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: _buildTable(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildTable() {
    return Table(
      border: TableBorder.all(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        const TableRow(children: [
          TableCell(child: Text("id")),
          TableCell(child: Text("姓名")),
          TableCell(child: Text("年龄")),
          TableCell(child: Text("性别")),
          TableCell(child: Text("修改")),
          TableCell(child: Text("删除")),
        ]),
        ...?_studentList
            ?.map((e) => TableRow(children: [
                  TableCell(child: Text("${e.id}")),
                  TableCell(child: Text("${e.name}")),
                  TableCell(child: Text("${e.age}")),
                  TableCell(child: Text("${e.sex}")),
                  TableCell(
                    child: TextButton(
                      onPressed: () {
                        updateData(e);
                      },
                      child: const Text("修改"),
                    ),
                  ),
                  TableCell(
                    child: TextButton(
                      onPressed: () {
                        deleteData(e.id!);
                      },
                      child: const Text("删除"),
                    ),
                  ),
                ]))
            .toList(),
      ],
    );
  }
}

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddStudentPageState();
  }
}

class _AddStudentPageState extends State<AddStudentPage> {
  int _sexValue = 0;
  late TextEditingController _nameController;
  late TextEditingController _ageController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("增加学生"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "姓名："),
            ),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(labelText: "年龄："),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<int>(
                    title: const Text("女"),
                    value: 0,
                    groupValue: _sexValue,
                    onChanged: (value) {
                      setState(() {
                        _sexValue = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<int>(
                    title: const Text("男"),
                    value: 1,
                    groupValue: _sexValue,
                    onChanged: (value) {
                      setState(() {
                        _sexValue = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            Builder(builder: (BuildContext context) {
              return Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      var student = Student(
                        name: _nameController.text.toString(),
                        age: int.parse(_ageController.text.toString()),
                        sex: _sexValue,
                      );
                      int result = await DBManager().saveData(student);
                      if (result > 0) {
                        showSnackBar(context, '保存数据成功，result:$result');
                      } else {
                        showSnackBar(context, '保存数据失败，result:$result');
                      }
                    },
                    child: const Text("保存数据"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var student = Student(
                        name: _nameController.text.toString(),
                        age: int.parse(_ageController.text.toString()),
                        sex: _sexValue,
                      );
                      int result = await DBManager().saveDataBySQL(student);
                      if (result > 0) {
                        showSnackBar(context, '保存数据成功，result:$result');
                      } else {
                        showSnackBar(context, '保存数据失败，result:$result');
                      }
                    },
                    child: const Text("使用SQL保存数据"),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
