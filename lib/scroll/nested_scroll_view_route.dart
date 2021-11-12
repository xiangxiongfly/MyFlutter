import 'package:flutter/material.dart';

class NestedScrollViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("NestedScrollView")),
      body: buildNestedScrollView3(),
    );
  }
}

SliverFixedExtentList buildSliverList(int count) {
  return SliverFixedExtentList(
    itemExtent: 50,
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      childCount: count,
    ),
  );
}

NestedScrollView buildNestedScrollView1() {
  return NestedScrollView(
    //Sliver组件
    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return [
        const SliverAppBar(
          title: Text("嵌套ListView"),
          pinned: true, //固定AppBar
          // floating: true,
          // snap: true,
          forceElevated: true,
        ),
        buildSliverList(5),
      ];
    },
    //滚动组件
    body: ListView.builder(
      padding: const EdgeInsets.all(8),
      physics: const ClampingScrollPhysics(), //需要
      itemCount: 30,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 50,
          child: Center(child: Text("item $index")),
        );
      },
    ),
  );
}

NestedScrollView buildNestedScrollView2() {
  return NestedScrollView(
    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return [
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: SliverAppBar(
            floating: true,
            snap: true,
            expandedHeight: 200,
            forceElevated: innerBoxIsScrolled,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("images/logo.png", fit: BoxFit.cover),
            ),
          ),
        ),
      ];
    },
    body: Builder(
      builder: (BuildContext context) {
        return CustomScrollView(
          slivers: [
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            buildSliverList(50),
          ],
        );
      },
    ),
  );
}

Widget buildNestedScrollView3() {
  final tabs = <String>["One", "Two", "Three"];
  return MyPageView(tabs: tabs);
}

class MyPageView extends StatefulWidget {
  late List<String> tabs;

  MyPageView({Key? key, required this.tabs}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyPageViewState();
  }
}

class _MyPageViewState extends State<MyPageView>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              title: const Text("hi Flutter"),
              floating: true,
              snap: true,
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                controller: _controller,
                tabs: widget.tabs.map((e) => Tab(text: e)).toList(),
              ),
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: _controller,
        children: widget.tabs.map((e) {
          return Builder(builder: (BuildContext context) {
            return CustomScrollView(
              key: PageStorageKey(e),
              slivers: [
                SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(9),
                  sliver: buildSliverList(50),
                ),
              ],
            );
          });
        }).toList(),
      ),
    );
  }
}
