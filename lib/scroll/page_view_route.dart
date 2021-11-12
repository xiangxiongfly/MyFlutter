import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PageViewPageState();
  }
}

class _PageViewPageState extends State<PageViewPage> {
  @override
  Widget build(BuildContext context) {
    List<Page> list = [];
    for (int i = 0; i < 5; i++) {
      list.add(Page(title: "$i"));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("PageView"),
      ),
      body: PageView(
        allowImplicitScrolling: true,
        children: list,
      ),
    );
  }
}

class Page extends StatelessWidget {
  final String title;

  const Page({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("创建子元素 $title");
    return Center(
      child: Text(
        "$title",
        textScaleFactor: 2,
      ),
    );
  }
}
