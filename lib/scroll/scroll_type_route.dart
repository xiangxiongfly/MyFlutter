import 'package:flutter/material.dart';
import 'package:myflutter/scroll/data_table_route.dart';
import 'package:myflutter/scroll/nested_scroll_view_route.dart';
import 'package:myflutter/scroll/sliver_persistent_header_route.dart';
import 'package:myflutter/scroll/sliver_to_box_adapter_route.dart';
import 'package:myflutter/scroll/sliverappbar_route.dart';
import 'package:myflutter/scroll/sliverlist_slivergrid_route.dart';

class ScrollTypePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动组件"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "scroll_view_route");
                },
                child: Text("SingleChildScrollView"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "list_view_route");
                },
                child: Text("ListView"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "notification_listener_route");
                },
                child: Text("滚动监听"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "animated_list_route");
                },
                child: Text("AnimatedList"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "grid_view_route");
                },
                child: Text("GridView"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "page_view_route");
                },
                child: Text("PageView"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "tabbar_view_route");
                },
                child: Text("TabBarView"),
              ),
              TextButton(
                child: Text("DataTable"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return DataTablePage();
                    }),
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "custom_scroll_view_route");
                },
                child: Text("CustomScrollView"),
              ),
              TextButton(
                child: Text("SliverList+SliverGrid"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SliverListSliverGridPage();
                  }));
                },
              ),
              TextButton(
                child: Text("SliverAppBar"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SliverAppBarPage();
                  }));
                },
              ),
              TextButton(
                child: Text("SliverPersistentHeader"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SliverPersistentHeaderPage();
                  }));
                },
              ),
              TextButton(
                child: Text("SliverToBoxAdapter"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SliverToBoxAdapterPage();
                  }));
                },
              ),
              TextButton(
                child: Text("NestedScrollView+SliverAppBar+ListView"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NestedScrollViewPage();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}