import 'package:flutter/material.dart';

class TablePage extends StatelessWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("表格组件"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyTablePage()),
                );
              },
              child: const Text("Table"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DataTablePage()),
                );
              },
              child: const Text("DataTable"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DataTable2Page()),
                );
              },
              child: const Text("DataTable 处理排序问题"),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTablePage extends StatelessWidget {
  const MyTablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Table"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            border: TableBorder.all(
              color: Colors.black,
              width: 1,
              style: BorderStyle.solid,
              borderRadius: BorderRadius.circular(5),
            ),
            children: const [
              TableRow(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  color: Colors.grey,
                ),
                children: [
                  TableCell(child: Center(child: Text("姓名"))),
                  TableCell(child: Center(child: Text("年龄"))),
                  TableCell(child: Center(child: Text("地址"))),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Center(child: Text("小明"))),
                  TableCell(child: Center(child: Text("18"))),
                  TableCell(child: Center(child: Text("北京市"))),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Center(child: Text("小花"))),
                  TableCell(child: Center(child: Text("19"))),
                  TableCell(child: Center(child: Text("广州市"))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DataTablePage extends StatelessWidget {
  const DataTablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DataTable"),
      ),
      body: Center(
        child: DataTable(
          border: TableBorder.all(
            color: Colors.black,
            width: 1,
            style: BorderStyle.solid,
            borderRadius: BorderRadius.circular(5),
          ),
          columns: [
            const DataColumn(label: Text("姓名")),
            const DataColumn(label: Text("年龄")),
            DataColumn(
              label: const Text("地址"),
              numeric: true,
              onSort: (int columnIndex, bool ascending) {},
            ),
          ],
          rows: const [
            DataRow(
              cells: [
                DataCell(Center(child: Text("小白"))),
                DataCell(Center(child: Text("18"))),
                DataCell(Center(child: Text("北京市"))),
              ],
            ),
            DataRow(cells: [
              DataCell(Center(child: Text("小黑"))),
              DataCell(Center(child: Text("16"))),
              DataCell(Center(child: Text("上海市"))),
            ]),
            DataRow(cells: [
              DataCell(Center(child: Text("小花"))),
              DataCell(Center(child: Text("20"))),
              DataCell(Center(child: Text("广州市"))),
            ]),
          ],
        ),
      ),
    );
  }
}

class DataTable2Page extends StatefulWidget {
  const DataTable2Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DataTable2PageState();
  }
}

class _DataTable2PageState extends State<DataTable2Page> {
  late List<User> _userList;
  var _sortAsc = true;

  @override
  void initState() {
    _userList = [
      User("小明", 18),
      User("小花", 19),
      User("小白", 20),
      User("小黑", 21),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DataTable 处理排序问题"),
      ),
      body: Center(
        child: DataTable(
          sortColumnIndex: 1,
          sortAscending: _sortAsc,
          columns: [
            const DataColumn(label: Text("姓名")),
            DataColumn(
              label: const Text("年龄"),
              onSort: (int columnIndex, bool ascending) {
                setState(() {
                  _sortAsc = ascending;
                  if (_sortAsc) {
                    _userList.sort((a, b) => a.age.compareTo(b.age));
                  } else {
                    _userList.sort((a, b) => b.age.compareTo(a.age));
                  }
                });
              },
            ),
          ],
          rows: _userList.map((e) {
            return DataRow(cells: [
              DataCell(Text(e.name)),
              DataCell(Text(e.age.toString())),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final int age;

  User(this.name, this.age);
}
