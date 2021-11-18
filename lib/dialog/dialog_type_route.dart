import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DialogTypePage extends StatelessWidget {
  const DialogTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹窗组件"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  showAlertDialog(context);
                },
                child: Text("AlertDialog弹窗"),
              ),
              OutlinedButton(
                onPressed: () {
                  showAlertDialog2(context);
                },
                child: Text("AlertDialog弹窗 样式二"),
              ),
              OutlinedButton(
                onPressed: () {
                  showCupertinoAlertDialog(context);
                },
                child: Text("CupertinoAlertDialog"),
              ),
              OutlinedButton(
                onPressed: () {
                  showSimpleDialog(context);
                },
                child: Text("SimpleDialog"),
              ),
              OutlinedButton(
                onPressed: () {
                  showCustomDialog(context);
                },
                child: Text("自定义Dialog"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//AlertDialog
showAlertDialog(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("确定删除吗？"),
        actions: [
          FlatButton(onPressed: () {}, child: Text("取消")),
          FlatButton(onPressed: () {}, child: Text("确定")),
        ],
      );
    },
  );
}

//AlertDialog自定义样式
showAlertDialog2(context) async {
  var result = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: Text("提示")),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 30,
        ),
        content: Center(heightFactor: 1, child: Text("确定删除吗？")),
        backgroundColor: Colors.yellowAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop("no");
            },
            child: Text("取消"),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop("yes");
            },
            child: Text("确定"),
          ),
        ],
      );
    },
  );
  print("结果：$result");
}

showCupertinoAlertDialog(context) {
  showCupertinoDialog(
    //点击空白处取消
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text("提示"),
        content: Text("确认删除吗？"),
        actions: [
          CupertinoDialogAction(
            child: Text("取消"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text("确定"),
            onPressed: () {},
          ),
        ],
      );
    },
  );
}

//SimpleAlertDialog
showSimpleDialog(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text("提示"),
        children: [
          Container(
            height: 80,
            alignment: Alignment.center,
            child: Text("确定删除吗？"),
          ),
          Divider(height: 1),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("取消"),
          ),
          Divider(height: 1),
          TextButton(
            onPressed: () {},
            child: Text("确定"),
          ),
        ],
      );
    },
  );
}

showCustomDialog(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "hello world",
            textAlign: TextAlign.center,
          ),
        ),
      );
    },
  );
}
