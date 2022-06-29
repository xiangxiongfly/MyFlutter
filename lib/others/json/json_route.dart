import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myflutter/bean/person.dart';
import 'package:myflutter/bean/user.dart';

class JsonPage extends StatelessWidget {
  const JsonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JSON解析"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                parseJson();
              },
              child: const Text("解析Json"),
            ),
            ElevatedButton(
              onPressed: () {
                parseJsonArray();
              },
              child: const Text("解析JsonArray"),
            ),
            ElevatedButton(
              onPressed: () {
                parseJson2();
              },
              child: const Text("解析Json（插件生成）"),
            ),
            ElevatedButton(
              onPressed: () {
                parseJsonArray2();
              },
              child: const Text("解析JsonArray（插件生成）"),
            ),
          ],
        ),
      ),
    );
  }

  parseJson() {
    String jsonStr = """{
    "name":"小明",
    "age":18,
    "address":"beijing"
}""";
    var jsonMap = json.decode(jsonStr);
    var user = User(jsonMap["name"], jsonMap["age"], jsonMap["address"]);
    print(user); //User{name: 小明, age: 18, address: beijing}
  }

  parseJsonArray() {
    String jsonArrayStr = """[
  {
    "name": "小黑",
    "age": 18,
    "address": "shanghai"
  },
  {
    "name": "小白",
    "age": 28,
    "address": "beijing"
  },
  {
    "name": "小明",
    "age": 38,
    "address": "广州"
  }
]""";
    List jsonArray = json.decode(jsonArrayStr);
    List<User> userList = jsonArray.map((e) => User(e["name"], e["age"], e["address"])).toList();
    print(
        userList); //[User{name: 小黑, age: 18, address: shanghai}, User{name: 小白, age: 28, address: beijing}, User{name: 小明, age: 38, address: 广州}]
  }

  parseJson2() {
    String jsonStr = """{
    "name":"小明",
    "age":18,
    "address":"beijing"
}""";
    var jsonMap = json.decode(jsonStr);
    var person = Person.fromJson(jsonMap);
    print(person);
  }

  parseJsonArray2() {
    String jsonArrayStr = """[
  {
    "name": "小黑",
    "age": 18,
    "address": "shanghai"
  },
  {
    "name": "小白",
    "age": 28,
    "address": "beijing"
  },
  {
    "name": "小明",
    "age": 38,
    "address": "广州"
  }
]""";
    List jsonArray = json.decode(jsonArrayStr);
    List<Person> userList = jsonArray.map((e) => Person.fromJson(e as Map<String, dynamic>)).toList();
    print(userList);
  }
}
