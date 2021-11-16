import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PageViewPageState();
  }
}

class _PageViewPageState extends State<PageViewPage> {
  @override
  Widget build(BuildContext context) {
    List<Page> pages = [];
    for (int i = 0; i < Colors.primaries.length; i++) {
      pages.add(
        Page(
          title: "$i",
          color: Colors.primaries[i],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("PageView"),
      ),
      body: PageView(
        allowImplicitScrolling: true,
        children: pages,
        controller: PageController(viewportFraction: 0.8, initialPage: 10),
        onPageChanged: (index) {},
      ),
    );
  }
}

class Page extends StatelessWidget {
  final String title;
  final Color color;

  const Page({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        "$title",
        textScaleFactor: 2,
      ),
    );
  }
}
