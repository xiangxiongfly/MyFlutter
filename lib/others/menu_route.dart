import 'package:flutter/material.dart';

class MenuTypePage extends StatelessWidget {
  const MenuTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("菜单类型组件"),
      ),
      body: Center(
        child: Column(
          children: [
            PopupMenuButton<String>(
              icon: const Icon(Icons.menu),
              tooltip: "显示菜单",
              initialValue: "语文",
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              itemBuilder: (context) {
                return const [
                  PopupMenuItem(
                    value: "语文",
                    child: Text("语文"),
                  ),
                  PopupMenuItem(
                    value: "英语",
                    child: Text("英语"),
                  ),
                  PopupMenuItem(
                    value: "数学",
                    child: Text("数学"),
                  ),
                  PopupMenuItem(
                    value: "物理",
                    child: Text("物理"),
                  ),
                ];
              },
              onSelected: (value) {
                print("选中：$value");
              },
              onCanceled: () {
                print("取消");
              },
              offset: Offset(0, 50),
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.menu),
              itemBuilder: (context) {
                return const [
                  CheckedPopupMenuItem(
                    value: "语文",
                    child: Text("语文"),
                    checked: true,
                  ),
                  CheckedPopupMenuItem(
                    value: "英语",
                    child: Text("英语"),
                  ),
                  CheckedPopupMenuItem(
                    value: "数学",
                    child: Text("数学"),
                  ),
                  CheckedPopupMenuItem(
                    value: "物理",
                    child: Text("物理"),
                  ),
                ];
              },
            ),
          ],
        ),
      ),
    );
  }
}
