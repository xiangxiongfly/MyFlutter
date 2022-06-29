import 'package:flutter/material.dart';
import 'package:myflutter/utils/sqlite_utils.dart';

import 'Student.dart';

class SqlitePage extends StatefulWidget {
  const SqlitePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SqlitePageState();
  }
}

class _SqlitePageState extends State<SqlitePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQLite"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AddStudentPage();
                }));
              },
              child: const Text("新增学生"),
            ),
          ],
        ),
      ),
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
              return ElevatedButton(
                onPressed: () async {
                  var student = Student(
                    name: _nameController.text.toString(),
                    age: int.parse(_nameController.text.toString()),
                    sex: _sexValue,
                  );
                  int result = await DBManager().saveData(student);
                  if (result > 0) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('保存数据成功，result:$result'),
                    ));
                  } else {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('保存数据失败，result:$result'),
                    ));
                  }
                },
                child: const Text("保存"),
              );
            }),
          ],
        ),
      ),
    );
  }
}
