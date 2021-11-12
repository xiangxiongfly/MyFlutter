import 'package:flutter/material.dart';

class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //顶部导航栏
      appBar: AppBar(
        title: Text("第二页"),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
          IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.home), onPressed: () {}),
            SizedBox(),
            IconButton(icon: Icon(Icons.business), onPressed: () {}),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      //悬浮按钮
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
