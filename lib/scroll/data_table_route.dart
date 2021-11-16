import 'package:flutter/material.dart';

class DataTablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DataTable"),
      ),
      body: Center(
        child: DataTable(
          sortColumnIndex: 1,
          sortAscending: true,
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
                DataCell(Text("上海")),
              ],
            ),
            DataRow(
              cells: [
                DataCell(Text("小明")),
                DataCell(Text("18")),
                DataCell(Text("北京")),
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
        ),
      ),
    );
  }
}
