import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewPageState();
  }
}

class _ListViewPageState extends State<ListViewPage> {
  final ScrollController _controller = ScrollController();
  bool showTopBtn = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print("滚动距离：${_controller.offset}");
      if (_controller.offset < 1000) {
        if (showTopBtn) {
          showTopBtn = false;
          setState(() {});
        }
      } else {
        if (!showTopBtn) {
          showTopBtn = true;
          setState(() {});
        }
      }
    });
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
        title: Text("ListView"),
        actions: [],
      ),
      body: ListView.builder(
          itemCount: null,
          itemExtent: 50,
          physics: BouncingScrollPhysics(),
          controller: _controller,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text("$index"));
          }),
      floatingActionButton: !showTopBtn
          ? null
          : FloatingActionButton(
              onPressed: () {
                _controller.animateTo(
                  0,
                  duration: Duration(microseconds: 800),
                  curve: Curves.ease,
                );
              },
              child: Icon(Icons.arrow_upward),
            ),
    );
  }
}

Widget getListView01() {
  return ListView(
    shrinkWrap: true,
    prototypeItem: Padding(padding: EdgeInsets.all(50), child: Text("A")),
    padding: EdgeInsets.all(20),
    children: const [
      Text("A"),
      Text("B"),
      Text("C"),
      Text("D"),
    ],
  );
}

Widget getListView02() {
  return ListView.builder(
      itemCount: null,
      itemExtent: 50,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      });
}

Widget getListView03() {
  Widget divider1 = Divider(color: Colors.red);
  Widget divider2 = Divider(color: Colors.blue);
  return ListView.separated(
    itemCount: 100,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(title: Text("$index"));
    },
    separatorBuilder: (BuildContext context, int index) {
      return index % 2 == 0 ? divider1 : divider2;
    },
  );
}
