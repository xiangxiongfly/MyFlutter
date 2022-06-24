import 'package:flutter/material.dart';
import 'package:myflutter/basic/scroll/animated_list_route.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView组件")),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SimpleListViewPage();
                }));
              },
              child: const Text("基本使用"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const DataListViewPage();
                }));
              },
              child: const Text("动态创建"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SeparatedListViewPage();
                }));
              },
              child: const Text("添加分割线"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ListViewScrollbarPage();
                }));
              },
              child: const Text("设置滚动条"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ListViewRefreshPage();
                }));
              },
              child: const Text("下拉刷新"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AnimatedListPage();
                }));
              },
              child: const Text("AnimatedList"),
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleListViewPage extends StatelessWidget {
  const SimpleListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView简单使用"),
      ),
      body: ListView(
        itemExtent: 50,
        // prototypeItem: const Padding(
        //   padding: EdgeInsets.all(20),
        //   child: Text("A"),
        // ),
        children: List.generate(5, (index) {
          return Center(child: Text("$index"));
        }),
      ),
    );
  }
}

class DataListViewPage extends StatefulWidget {
  const DataListViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DataListViewPageState();
  }
}

class _DataListViewPageState extends State<DataListViewPage> {
  final ScrollController _controller = ScrollController();
  bool showTopBtn = false;

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.offset < 100) {
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
        title: const Text("动态创建&滚动监听"),
      ),
      body: ListView.builder(
        controller: _controller,
        itemCount: 50,
        itemExtent: 50,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Center(child: Text("$index")));
        },
      ),
      floatingActionButton: !showTopBtn
          ? null
          : FloatingActionButton(
              child: const Icon(Icons.vertical_align_top),
              onPressed: () {
                _controller.animateTo(0, duration: const Duration(microseconds: 800), curve: Curves.ease);
              },
            ),
    );
  }
}

class SeparatedListViewPage extends StatelessWidget {
  const SeparatedListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget divider1 = const Divider(color: Colors.red);
    Widget divider2 = const Divider(color: Colors.blue);
    return Scaffold(
      appBar: AppBar(
        title: const Text("添加分割线"),
      ),
      body: ListView.separated(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Center(child: Text("$index")));
        },
        separatorBuilder: (BuildContext context, int index) {
          return index % 2 == 0 ? divider1 : divider2;
        },
      ),
    );
  }
}

class ListViewScrollbarPage extends StatelessWidget {
  const ListViewScrollbarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("设置滚动条"),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Center(child: Text(index.toString()));
          },
          itemCount: 50,
          itemExtent: 50,
        ),
      ),
    );
  }
}

class ListViewRefreshPage extends StatefulWidget {
  const ListViewRefreshPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListViewRefreshPageState();
  }
}

class _ListViewRefreshPageState extends State<ListViewRefreshPage> {
  List list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("下拉刷新"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            list.insert(0, "新数据");
          });
        },
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Center(child: Text(list[index].toString()));
          },
          itemExtent: 50,
          itemCount: list.length,
        ),
      ),
    );
  }
}
