import 'package:flutter/material.dart';

class OtherTypePage extends StatelessWidget {
  const OtherTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("功能组件"),
      ),
      body: Center(
        child: Column(
          children: [
            OutlinedButton(
              onPressed: () {
                showDate(context);
              },
              child: Text("日期"),
            ),
            OutlinedButton(
              onPressed: () {
                showTime(context);
              },
              child: Text("时间"),
            ),
          ],
        ),
      ),
    );
  }
}

//日期弹窗
showDate(context) async {
  var result = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2020),
    lastDate: DateTime(2025),
    helpText: "选择日期",
    confirmText: "确定",
    cancelText: "取消",
  );
  print("日期 $result");
}

showTime(context) async {
  var result = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  print("时间 $result");
}
