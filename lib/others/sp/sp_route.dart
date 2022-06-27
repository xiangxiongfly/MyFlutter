import 'package:flutter/material.dart';
import 'package:myflutter/utils/sp_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpPage extends StatefulWidget {
  const SpPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SpPageState();
  }
}

class _SpPageState extends State<SpPage> {
  var description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("shared_preferences"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  saveData();
                },
                child: const Text("写数据")),
            ElevatedButton(
                onPressed: () {
                  getData();
                },
                child: const Text("读数据")),
            ElevatedButton(
                onPressed: () {
                  removeData();
                },
                child: const Text("删除一个数据")),
            ElevatedButton(
                onPressed: () {
                  removeAllData();
                },
                child: const Text("删除所有数据")),
            ElevatedButton(
                onPressed: () {
                  getKeys();
                },
                child: const Text("查询所有key")),
            ElevatedButton(
                onPressed: () {
                  containsKey();
                },
                child: const Text("检查key是否存在")),
            Text(description),
          ],
        ),
      ),
    );
  }

  saveData() async {
    var sp = await SharedPreferences.getInstance();
    sp.setString("name", "小明");
    sp.setInt("age", 18);
    sp.setBool("sex", true);
    sp.setDouble("height", 180.1);
    sp.setStringList("address", <String>["北京市", "海淀区"]);
  }

  getData() async {
    var sp = await SharedPreferences.getInstance();
    String? name = sp.getString("name");
    int? age = sp.getInt("age");
    bool? sex = sp.getBool("sex");
    double? height = sp.getDouble("height");
    List<String>? address = sp.getStringList("address");
    setState(() {
      description = """
         姓名：${name ?? ""}
         年龄：${age ?? ""}
         性别：${sex ?? ""}
         身高：${height ?? ""}
         地址：${address ?? ""}
      """;
    });
  }

  removeData() async {
    var sp = await SharedPreferences.getInstance();
    sp.remove("name");
  }

  removeAllData() async {
    var sp = await SharedPreferences.getInstance();
    sp.clear();
  }

  getKeys() async {
    var sp = await SharedPreferences.getInstance();
    var keys = sp.getKeys();
    setState(() {
      description = keys.toString();
    });
  }

  containsKey() async {
    var sp = await SharedPreferences.getInstance();
    var b = sp.containsKey("name");
    setState(() {
      description = "name是否存在：$b";
    });
  }
}
