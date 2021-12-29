import 'package:flutter/material.dart';
import 'package:myflutter/container/clip_route.dart';
import 'package:myflutter/others/menu_route.dart';

class OtherTypePage extends StatelessWidget {
  const OtherTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("功能型组件"),
      ),
      body: Column(
        children: [
          OutlinedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MenuTypePage();
              }));
            },
            child: Text("菜单组件"),
          ),
        ],
      ),
    );
  }
}
