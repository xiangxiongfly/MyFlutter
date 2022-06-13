import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("弹窗组件"),
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
                child: const Text("AlertDialog弹窗"),
              ),
              OutlinedButton(
                onPressed: () {
                  showCustomAlertDialog(context);
                },
                child: const Text("AlertDialog自定义样式"),
              ),
              OutlinedButton(
                onPressed: () {
                  showCupertinoAlertDialog(context);
                },
                child: const Text("CupertinoAlertDialog"),
              ),
              OutlinedButton(
                onPressed: () {
                  showSimpleDialog(context);
                },
                child: const Text("SimpleDialog"),
              ),
              OutlinedButton(
                onPressed: () {
                  showCustomDialog(context);
                },
                child: const Text("自定义Dialog"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// AlertDialog
showAlertDialog(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("提示"),
        content: const Text("确定删除吗？"),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("取消"),
          ),
          FlatButton(onPressed: () {}, child: const Text("确定")),
        ],
      );
    },
  );
}

/// AlertDialog自定义样式
showCustomAlertDialog(context) async {
  var result = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        //标题
        title: const Center(child: Text("提示")),
        //标题样式
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 30,
        ),
        //内容区
        content: const Center(heightFactor: 1, child: Text("确定删除吗？")),
        //背景颜色
        backgroundColor: Colors.yellowAccent,
        //弹窗形状
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop("no");
            },
            child: const Text("取消"),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop("yes");
            },
            child: const Text("确定"),
          ),
        ],
      );
    },
  );
  print("返回结果：$result");
}

/// iOS风格
showCupertinoAlertDialog(context) {
  showCupertinoDialog(
    //点击空白处不取消
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text("提示"),
        content: const Text("确认删除吗？"),
        actions: [
          CupertinoDialogAction(
            child: const Text("取消"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: const Text("确定"),
            onPressed: () {},
          ),
        ],
      );
    },
  );
}

/// SimpleDialog
showSimpleDialog(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Center(child: Text("提示")),
        contentPadding: EdgeInsets.all(0),
        children: [
          Container(
            height: 80,
            alignment: Alignment.center,
            child: const Text("确定删除吗？"),
          ),
          Container(width: double.infinity, height: 1, color: Colors.black),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("取消"),
                  ),
                ),
                Container(width: 1, height: 50, color: Colors.black),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("确定"),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

/// 自定义Dialog
showCustomDialog(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const Dialog(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "hello world",
            textAlign: TextAlign.center,
          ),
        ),
      );
    },
  );
}
