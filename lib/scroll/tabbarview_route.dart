import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TabBarViewPage extends StatefulWidget {
  const TabBarViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TabBarViewPageState();
  }
}

class _TabBarViewPageState extends State<TabBarViewPage> with SingleTickerProviderStateMixin {
  final List tabs = ["One", "Two", "Three", "Four", "Five", "Six", "Seven"];
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TabBarView & PageView"),
        bottom: TabBar(
          indicatorColor: Colors.red,
          controller: _controller,
          isScrollable: true,
          tabs: tabs.map((e) {
            return Tab(text: e);
          }).toList(),
        ),
      ),
      body: TabBarView(
        dragStartBehavior: DragStartBehavior.down,
        controller: _controller,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 3),
          );
        }).toList(),
      ),
    );
  }
}
