import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myflutter/others/json/student.dart' as student;
import 'package:myflutter/others/json/student_list.dart' as student_list;

class JsonPage extends StatefulWidget {
  const JsonPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _JsonPageState();
  }
}

class _JsonPageState extends State<JsonPage> {
  @override
  Widget build(BuildContext context) {
    // _parseJson();
    // _parseArrayJson();
    _parseJson2();
    _parseArrayJson2();
    return Scaffold(
      appBar: AppBar(
        title: const Text("JSON解析"),
      ),
    );
  }
}

_parseJson() {
  rootBundle.loadString("assets/student.json").then((jsonStr) {
    final jsonMap = json.decode(jsonStr);
    User user = User(jsonMap["name"], jsonMap["age"], jsonMap["address"]);
    print(user);

    //User{name: 小明, age: 18, address: beijing}
  });
}

_parseArrayJson() {
  rootBundle.loadString("assets/students.json").then((jsonStr) {
    List<dynamic> jsonArr = json.decode(jsonStr);
    List<User> userList = jsonArr.map((e) => User(e["name"], e["age"], e["address"])).toList();
    print(userList);

    // [User{name: 小黑, age: 18, address: shanghai}, User{name: 小白, age: 28, address: beijing}, User{name: 小明, age: 38, address: 广州}]
  });
}

_parseJson2() {
  rootBundle.loadString("assets/student.json").then((jsonStr) {
    var stu = student.studentFromJson(jsonStr);
    print(stu);

    // Student{_name: 小明, _age: 18, _address: beijing}
  });
}

_parseArrayJson2() {
  rootBundle.loadString("assets/students.json").then((jsonStr) {
    final stuList = student_list.studentFromJson(jsonStr);
    print(stuList);

    //[Student{name: 小黑, age: 18, address: shanghai}, Student{name: 小白, age: 28, address: beijing}, Student{name: 小明, age: 38, address: 广州}]
  });
}

class User {
  final String name;
  final int age;
  final String address;

  User(this.name, this.age, this.address);

  @override
  String toString() {
    return 'User{name: $name, age: $age, address: $address}';
  }
}

// const json = "{
//     "name":"小明",
// "age":18,
// "address":"beijing"
// }";
