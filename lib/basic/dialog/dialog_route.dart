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
        title: const Text("提示"),
        children: [
          Container(
            height: 80,
            alignment: Alignment.center,
            child: const Text("确认删除吗？"),
          ),
          const Divider(height: 1),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("取消"),
          ),
          const Divider(height: 1),
          TextButton(
            onPressed: () {},
            child: const Text("确认"),
          ),
        ],
      );
    },
  );
}

/// 自定义Dialog
showCustomDialog(context) async {
  var result = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "提示",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 80,
              child: Center(child: Text("确认删除吗？")),
            ),
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: const SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Center(child: Text("取消")),
                      ),
                      onTap: () {
                        Navigator.pop(context, "no");
                      },
                    ),
                  ),
                  Container(
                    width: 1,
                    height: double.infinity,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: const SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Center(child: Text("确定")),
                      ),
                      onTap: () {
                        Navigator.pop(context, "yes");
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    },
  );
  print("result: $result");
}
