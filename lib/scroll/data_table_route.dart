import 'package:flutter/material.dart';

class DataTablePage extends StatefulWidget {
  const DataTablePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DataTablePageState();
  }
}

class _DataTablePageState extends State<DataTablePage> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        title: Text("DataTable"),
      ),
      body: Center(
        child: _buildDataTable02(),
      ),
    );
  }

  _buildDataTable01() {
    return DataTable(
      columns: const [
        DataColumn(label: Text("姓名")),
        DataColumn(label: Text("年龄")),
        DataColumn(label: Text("地址")),
      ],
      rows: const [
        DataRow(
          cells: [
            DataCell(Text("小黑")),
            DataCell(Text("38")),
            DataCell(Text("上海"), showEditIcon: true),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text("小明")),
            DataCell(Text("18")),
            DataCell(Text("乌鲁木齐")),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text("小白")),
            DataCell(Text("28")),
            DataCell(Text("广州")),
          ],
        ),
      ],
    );
  }

  List<User> datas = [
    User("小明", 48, "北京"),
    User("小白", 28, "上海"),
    User("小黑", 38, "乌鲁木齐"),
    User("小花", 18, "哈尔滨"),
  ];
  bool _sortAscending = false;

  _buildDataTable02() {
    List<DataRow> dataRows = [];
    for (int i = 0; i < datas.length; i++) {
      dataRows.add(
        DataRow(
          cells: [
            DataCell(Text(datas[i].name)),
            DataCell(Text(datas[i].age.toString())),
            DataCell(Text(datas[i].address)),
          ],
          selected: datas[i].selected,
          onSelectChanged: (selected) {
            setState(() {
              datas[i].selected = selected!;
            });
          },
        ),
      );
    }
    return DataTable(
      sortColumnIndex: 1,
      sortAscending: _sortAscending,
      columns: [
        DataColumn(label: Text("姓名")),
        DataColumn(
          label: Text("年龄"),
          onSort: (int columnIndex, bool ascending) {
            setState(() {
              _sortAscending = ascending;
              if (ascending) {
                datas.sort((a, b) {
                  return a.age.compareTo(b.age);
                });
              } else {
                datas.sort((a, b) {
                  return b.age.compareTo(a.age);
                });
              }
            });
          },
        ),
        DataColumn(label: Text("地址")),
      ],
      rows: dataRows,
    );
  }
}

class User {
  String name;
  int age;
  String address;
  bool selected;

  User(this.name, this.age, this.address, {this.selected = false});
}
