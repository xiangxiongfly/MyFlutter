import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

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
      appBar: AppBar(title: const Text("ListView")),
      body: getListView04(_controller),
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
              child: const Icon(Icons.arrow_upward),
            ),
    );
  }
}

Widget getListView01() {
  return ListView(
    itemExtent: 50,
    // prototypeItem: Padding(
    //   padding: EdgeInsets.all(20),
    //   child: Text("A"),
    // ),
    children: List.generate(5, (index) {
      return Center(child: Text("$index"));
    }),
  );
}

Widget getListView02() {
  return ListView.builder(
    itemCount: 50,
    itemExtent: 50,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(title: Center(child: Text("$index")));
    },
  );
}

Widget getListView03() {
  Widget divider1 = Divider(color: Colors.red);
  Widget divider2 = Divider(color: Colors.blue);
  return ListView.separated(
    itemCount: 100,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(title: Center(child: Text("$index")));
    },
    separatorBuilder: (BuildContext context, int index) {
      return index % 2 == 0 ? divider1 : divider2;
    },
  );
}

Widget getListView04(controller) {
  return ListView.builder(
    itemCount: null,
    itemExtent: 50,
    physics: const BouncingScrollPhysics(),
    controller: controller,
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        onTap: () => {},
        child: ListTile(
          title: Center(child: Text("$index")),
        ),
      );
    },
  );
}
