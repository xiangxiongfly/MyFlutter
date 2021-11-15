import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/container/clipe_route.dart';
import 'package:myflutter/container/container_route.dart';
import 'package:myflutter/container/container_type_route.dart';
import 'package:myflutter/container/decorated_box_route.dart';
import 'package:myflutter/container/fitted_box_route.dart';
import 'package:myflutter/container/padding_route.dart';
import 'package:myflutter/container/transform_route.dart';
import 'package:myflutter/layout/align__route.dart';
import 'package:myflutter/layout/center_route.dart';
import 'package:myflutter/layout/constraint_route.dart';
import 'package:myflutter/layout/flex_route.dart';
import 'package:myflutter/layout/linear_route.dart';
import 'package:myflutter/layout/wrap_flow_route.dart';
import 'package:myflutter/scroll/animated_list_route.dart';
import 'package:myflutter/scroll/custom_scroll_view_route.dart';
import 'package:myflutter/scroll/grid_view_route.dart';
import 'package:myflutter/scroll/list_view_route.dart';
import 'package:myflutter/scroll/nested_scroll_view_route.dart';
import 'package:myflutter/scroll/notification_listener_route.dart';
import 'package:myflutter/scroll/page_view_route.dart';
import 'package:myflutter/scroll/scroll_type.dart';
import 'package:myflutter/scroll/scroll_view_route.dart';
import 'package:myflutter/scroll/tabbar_view_route.dart';
import 'package:myflutter/simple/button_route.dart';
import 'package:myflutter/simple/form_route.dart';
import 'package:myflutter/simple/image_route.dart';
import 'package:myflutter/simple/input_route.dart';
import 'package:myflutter/simple/progress_route.dart';
import 'package:myflutter/simple/simple_type_route.dart';
import 'package:myflutter/simple/switch_checkbox_route.dart';
import 'package:myflutter/simple/text_route.dart';

import 'container/aspect_ratio_route.dart';
import 'container/sized_box_route.dart';
import 'second.dart';
import 'layout/layout_builder_route.dart';
import 'layout/layout_type_route.dart';
import 'layout/stack_positioned__route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //隐藏debug角标
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => const MyHomePage(title: '首页'),
        //基本组件
        "simple_route": (context) => SimplePage(),
        "text_route": (context) => TextPage(),
        "button_route": (context) => ButtonPage(),
        "image_route": (context) => ImagePage(),
        "switch_checkbox_route": (context) => SwitchCheckBoxPage(),
        "input_route": (context) => InputPage(),
        "form_route": (context) => FormPage(),
        "progress_route": (context) => ProgressPage(),
        //布局组件
        "layout_route": (context) => LayoutPage(),
        "constraint_route": (context) => ConstraintPage(),
        "linear_route": (context) => LinearLayoutPage(),
        "flex_route": (context) => FlexPage(),
        "wrap_flow_route": (context) => WrapFlowPage(),
        "stack_positioned_route": (context) => StackPositionedPage(),
        "align_route": (context) => AlignPage(),
        "center_route": (context) => CenterPage(),
        "layout_builder_route": (context) => LayoutBuilderPage(),
        //容器类组件
        "container_type_route": (context) => ContainerTypePage(),
        "container_route": (context) => ContainerPage(),
        "sized_box_route": (context) => SizedBoxPage(),
        "padding_route": (context) => PaddingPage(),
        "aspect_ratio_route": (context) => AspectRatioPage(),
        "DecoratedBox_route": (context) => DecoratedBoxPage(),
        "transform_route": (context) => TransformPage(),
        "clip_route": (context) => ClipPage(),
        "fitted_box_route": (context) => FittedBoxPage(),
        //滚动组件
        "scroll_type_route": (context) => ScrollTypePage(),
        "scroll_view_route": (context) => SingleChildScrollViewPage(),
        "list_view_route": (context) => ListViewPage(),
        "notification_listener_route": (context) => NotificationListenerPage(),
        "animated_list_route": (context) => AnimatedListPage(),
        "grid_view_route": (context) => GridViewPage(),
        "page_view_route": (context) => PageViewPage(),
        "tabbar_view_route": (context) => TabBarViewPage(),
        "custom_scroll_view_route": (context) => CustomScrollViewPage(),
        "nested_scroll_view_route": (context) => NestedScrollViewPage(),
      },
      initialRoute: "/",
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? lastTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (lastTime == null ||
            DateTime.now().difference(lastTime!) > const Duration(seconds: 1)) {
          lastTime = DateTime.now();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("再按一次退出程序")),
          );
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        //顶部导航栏
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(icon: const Icon(Icons.share), onPressed: () {}),
          ],
        ),
        //抽屉菜单
        drawer: MyDrawer(),
        //页面主题部分
        body: MyBody(),
        //底部Tab导航栏
        bottomNavigationBar: MyBottomNavigationBar(),
        //悬浮按钮
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 38),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: ClipOval(
                      child: Image.asset(
                        "images/logo.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "hello world",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.looks_two),
                    title: Text("跳转第二页"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return TwoPage();
                        }),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.account_box),
                    title: Text("账号"),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("设置"),
                  ),
                  ListTile(
                    leading: Icon(Icons.close),
                    title: Text("关闭抽屉菜单"),
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          ElevatedButton(
            child: Text("基本组件"),
            onPressed: () {
              Navigator.pushNamed(context, "simple_route");
            },
          ),
          ElevatedButton(
            child: Text("布局组件"),
            onPressed: () {
              Navigator.pushNamed(context, "layout_route");
            },
          ),
          ElevatedButton(
            child: Text("容器类组件"),
            onPressed: () {
              Navigator.pushNamed(context, "container_type_route");
            },
          ),
          ElevatedButton(
            child: Text("滚动组件"),
            onPressed: () {
              Navigator.pushNamed(context, "scroll_type_route");
            },
          ),
        ],
      ),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyBottomNavigationBarState();
  }
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: "business",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: "school",
        ),
      ],
      currentIndex: _selectedIndex,
      //fixedColor: Colors.blue,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
