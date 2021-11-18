import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateTimeTypePage extends StatelessWidget {
  const DateTimeTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("日期时间组件"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  showDate(context);
                },
                child: Text("日期弹窗"),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DatePage();
                  }));
                },
                child: Text("日期页面"),
              ),
              OutlinedButton(
                onPressed: () {
                  showDateRange(context);
                },
                child: Text("日期范围"),
              ),
              OutlinedButton(
                onPressed: () {
                  showTime(context);
                },
                child: Text("时间弹窗"),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return IosDateTimePage();
                  }));
                },
                child: Text("ios风格日期选择器"),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return IosTimePage();
                  }));
                },
                child: Text("ios风格时间选择器"),
              ),
            ],
          ),
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

//日期页面
class DatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2025),
            onDateChanged: (DateTime dateTime) {
              print("日期 $dateTime");
            },
          ),
        ),
      ),
    );
  }
}

//日期范围
showDateRange(context) async {
  var date = await showDateRangePicker(
    context: context,
    firstDate: DateTime(2020),
    lastDate: DateTime(2025),
  );
  print("日期范围：$date");
}

//时间弹窗
showTime(context) async {
  var result = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  print("时间 $result");
}

//IOS风格日期选择器
class IosDateTimePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        initialDateTime: DateTime.now(),
        onDateTimeChanged: (DateTime dateTime) {
          print("ios风格日期选择器：$dateTime");
        },
      ),
    );
  }
}

//IOS风格时间选择器
class IosTimePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoTimerPicker(
        initialTimerDuration: Duration(
          hours: DateTime.now().hour,
          minutes: DateTime.now().minute,
          seconds: DateTime.now().second,
        ),
        onTimerDurationChanged: (Duration time) {
          print("ios风格时间选择器：$time");
        },
      ),
    );
  }
}
