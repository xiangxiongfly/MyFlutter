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
                  showDialogFunction(context);
                },
                child: const Text("showDialog"),
              ),
              OutlinedButton(
                onPressed: () {
                  showCupertinoDialogFunction(context);
                },
                child: const Text("showCupertinoDialog"),
              ),
              OutlinedButton(
                onPressed: () {
                  showGeneralDialogFunction(context);
                },
                child: const Text("showGeneralDialog 移动动画"),
              ),
              OutlinedButton(
                onPressed: () {
                  showGeneralDialogFunction2(context);
                },
                child: const Text("showGeneralDialog2 缩放动画"),
              ),
              Builder(builder: (context) {
                return OutlinedButton(
                  onPressed: () {
                    showBottomSheetFunction(context);
                  },
                  child: const Text("showBottomSheet"),
                );
              }),
              Builder(builder: (context) {
                return OutlinedButton(
                  onPressed: () {
                    showModalBottomSheetFunction(context);
                  },
                  child: const Text("showModalBottomSheet"),
                );
              }),
              Builder(builder: (context) {
                return OutlinedButton(
                  onPressed: () {
                    showCupertinoModalPopupFunction(context);
                  },
                  child: const Text("showCupertinoModalPopup"),
                );
              }),
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

/// showDialog
showDialogFunction(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("提示"),
        content: const Text("确定删除吗？"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("取消"),
          ),
          TextButton(onPressed: () {}, child: const Text("确定")),
        ],
      );
    },
  );
}

/// showCupertinoDialog
showCupertinoDialogFunction(context) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("提示"),
        content: const Text("确定删除吗？"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("取消"),
          ),
          TextButton(onPressed: () {}, child: const Text("确定")),
        ],
      );
    },
  );
}

/// showGeneralDialog：平移动画
showGeneralDialogFunction(context) {
  showGeneralDialog(
    context: context,
    pageBuilder:
        (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return AlertDialog(
        title: const Text("提示"),
        content: const Text("确定删除吗？"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("取消"),
          ),
          TextButton(onPressed: () {}, child: const Text("确定")),
        ],
      );
    },
    transitionDuration: const Duration(seconds: 1),
    transitionBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return FractionalTranslation(
        //从左向右滑出
        // translation: Offset(animation.value - 1, 0),
        //从右向左滑出
        // translation: Offset(1 - animation.value, 0),
        //从顶部滑出
        // translation: Offset(0, animation.value - 1),
        //从底部滑出
        translation: Offset(0, 1 - animation.value),
        child: child,
      );
    },
  );
}

/// showGeneralDialog：缩放动画
showGeneralDialogFunction2(context) {
  showGeneralDialog(
    context: context,
    pageBuilder:
        (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return AlertDialog(
        title: const Text("提示"),
        content: const Text("确定删除吗？"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("取消"),
          ),
          TextButton(onPressed: () {}, child: const Text("确定")),
        ],
      );
    },
    transitionBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return ScaleTransition(
        alignment: Alignment.center,
        scale: animation,
        child: child,
      );
    },
  );
}

/// showBottomSheet：底部弹窗
showBottomSheetFunction(context) {
  showBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        height: 240,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 55,
              child: const Text(
                "提示",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const Expanded(
              child: Text(
                "这是一些信息这是一些信息这是一些信息这是一些信息这是一些信息这是一些信息",
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(
              height: 65,
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      child: const Text("再考虑下"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      child: const Text("考虑好了"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

/// showModalBottomSheet：Material风格的底部弹窗
showModalBottomSheetFunction(context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        height: 240,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 55,
              child: const Text(
                "提示",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const Expanded(
              child: Text(
                "这是一些信息这是一些信息这是一些信息这是一些信息这是一些信息这是一些信息",
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(
              height: 65,
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      child: const Text("再考虑下"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      child: const Text("考虑好了"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

/// showCupertinoModalPopup：iOS风格的底部弹窗
showCupertinoModalPopupFunction(context) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        height: 240,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 55,
              child: const Text(
                "提示",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const Expanded(
              child: Text(
                "这是一些信息这是一些信息这是一些信息这是一些信息这是一些信息这是一些信息",
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(
              height: 65,
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      child: const Text("再考虑下"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      child: const Text("考虑好了"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
            Container(
              height: 1,
              width: double.infinity,
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
