import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myflutter/animation/animation_type_page.dart';
import 'package:myflutter/container/aspect_ratio_route.dart';
import 'package:myflutter/container/clip_route.dart';
import 'package:myflutter/container/container_route.dart';
import 'package:myflutter/container/container_type_route.dart';
import 'package:myflutter/container/decorated_box_route.dart';
import 'package:myflutter/container/fitted_box_route.dart';
import 'package:myflutter/container/fractionally_sized_box_route.dart';
import 'package:myflutter/container/padding_route.dart';
import 'package:myflutter/container/sized_box_route.dart';
import 'package:myflutter/container/transform_route.dart';
import 'package:myflutter/datetime/date_time_type_route.dart';
import 'package:myflutter/demo_widget.dart';
import 'package:myflutter/dialog/dialog_type_route.dart';
import 'package:myflutter/drag/drag_route.dart';
import 'package:myflutter/gesture_detector/gesture_detector_type_route.dart';
import 'package:myflutter/layout/align__route.dart';
import 'package:myflutter/layout/center_route.dart';
import 'package:myflutter/layout/constraint_route.dart';
import 'package:myflutter/layout/flex_route.dart';
import 'package:myflutter/layout/layout_builder_route.dart';
import 'package:myflutter/layout/layout_type_route.dart';
import 'package:myflutter/layout/linear_route.dart';
import 'package:myflutter/layout/stack_positioned__route.dart';
import 'package:myflutter/layout/wrap_flow_route.dart';
import 'package:myflutter/others/other_type_route.dart';
import 'package:myflutter/sample/banner.dart';
import 'package:myflutter/sample/comment_list.dart';
import 'package:myflutter/scroll/animated_list_route.dart';
import 'package:myflutter/scroll/custom_scroll_view_route.dart';
import 'package:myflutter/scroll/grid_view_route.dart';
import 'package:myflutter/scroll/list_view_route.dart';
import 'package:myflutter/scroll/notification_listener_route.dart';
import 'package:myflutter/scroll/page_view_route.dart';
import 'package:myflutter/scroll/scroll_type_route.dart';
import 'package:myflutter/scroll/scroll_view_route.dart';
import 'package:myflutter/scroll/tabbar_view_route.dart';
import 'package:myflutter/second.dart';
import 'package:myflutter/shape/shape_type_route.dart';
import 'package:myflutter/simple/button_route.dart';
import 'package:myflutter/simple/form_route.dart';
import 'package:myflutter/simple/image_route.dart';
import 'package:myflutter/simple/input_route.dart';
import 'package:myflutter/simple/progress_route.dart';
import 'package:myflutter/simple/simple_type_route.dart';
import 'package:myflutter/simple/switch_checkbox_route.dart';
import 'package:myflutter/simple/text_route.dart';
import 'package:myflutter/storage/storage_route.dart';

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
      //国际化
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh'),
        const Locale('en'),
      ],

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
        "fractionally_sized_box_route": (context) => FractionallySizedBoxPage(),
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
        //手势组件
        "gesture_detector_type_page": (context) => GestureDetectorTypePage(),
        //动画组件
        "animation_type_page": (context) => AnimationTypePage(),
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
        if (lastTime == null || DateTime.now().difference(lastTime!) > const Duration(seconds: 1)) {
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
                        "images/avatar.jpg",
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
                    leading: Icon(Icons.slideshow),
                    title: Text("轮播图"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return BannerPage();
                        }),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.comment),
                    title: Text("评论列表效果"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return CommentListPage();
                        }),
                      );
                    },
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
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: const Text("测试组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DemoWidget("hello world")),
                );
              },
            ),
            ElevatedButton(
              child: const Text("基本组件"),
              onPressed: () {
                Navigator.pushNamed(context, "simple_route");
              },
            ),
            ElevatedButton(
              child: const Text("布局组件"),
              onPressed: () {
                Navigator.pushNamed(context, "layout_route");
              },
            ),
            ElevatedButton(
              child: const Text("容器类组件"),
              onPressed: () {
                Navigator.pushNamed(context, "container_type_route");
              },
            ),
            ElevatedButton(
              child: const Text("滚动组件"),
              onPressed: () {
                Navigator.pushNamed(context, "scroll_type_route");
              },
            ),
            ElevatedButton(
              child: const Text("手势组件"),
              onPressed: () {
                Navigator.pushNamed(context, "gesture_detector_type_page");
              },
            ),
            ElevatedButton(
              child: const Text("弹窗组件"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DialogTypePage();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("日期时间组件"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DateTimeTypePage();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("shape组件"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ShapePage();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("clip组件"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ClipPage();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("功能型组件"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OtherTypePage();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("拖拽组件"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DragPage();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("数据存储组件"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StoragePage();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("动画组件"),
              onPressed: () {
                Navigator.pushNamed(context, "animation_type_page");
              },
            ),
          ],
        ),
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
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        BottomNavigationBarItem(icon: Icon(Icons.business), label: "business"),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: "school"),
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
