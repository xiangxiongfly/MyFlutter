import 'package:flutter/material.dart';

class TabBarViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabBarViewPageState();
  }
}

class _TabBarViewPageState extends State<TabBarViewPage>
    with SingleTickerProviderStateMixin {
  final List tabs = ["One", "Two", "Three", "Four", "Five", "Six", "Seven"];
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBarView"),
        bottom: TabBar(
          controller: _controller,
          isScrollable: true,
          tabs: tabs.map((e) {
            return Tab(text: e);
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              e,
              textScaleFactor: 3,
            ),
          );
        }).toList(),
      ),
    );
  }
}
