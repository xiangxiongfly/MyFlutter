import 'package:flutter/material.dart';

class CustomScrollViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("CustomScrollView"),
      // ),
      body: buildCustomScrollView2(),
    );
  }
}

CustomScrollView buildCustomScrollView() {
  var listView = SliverFixedExtentList(
    itemExtent: 50,
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      childCount: 10,
    ),
  );
  return CustomScrollView(
    slivers: [
      listView,
      listView,
    ],
  );
}

CustomScrollView buildCustomScrollView2() {
  //AppBar
  final appBar = SliverAppBar(
    pinned: true, //滑动是标题是否固定
    expandedHeight: 250, //展开高度
    flexibleSpace: FlexibleSpaceBar(
      title: const Text("hello world"),
      background: Image.asset(
        "images/logo.png",
        fit: BoxFit.cover,
      ),
    ),
  );

  //GridView
  final gridView = SliverGrid(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1,
    ),
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Container(
          alignment: Alignment.center,
          color: Colors.grey,
          child: Text("GridView $index"),
        );
      },
      childCount: 20,
    ),
  );

  //Padding
  final padding = SliverPadding(
    padding: EdgeInsets.all(8),
    sliver: gridView,
  );

  //ListView
  final listView = SliverFixedExtentList(
    delegate: SliverChildBuilderDelegate((context, index) {
      return Container(
        alignment: Alignment.center,
        color: Colors.lightBlue,
        child: Text("ListView $index"),
      );
    }),
    itemExtent: 50,
  );

  return CustomScrollView(
    slivers: [
      appBar,
      padding,
      listView,
    ],
  );
}
