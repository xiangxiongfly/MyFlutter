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
import 'package:myflutter/data/data_route.dart';
import 'package:myflutter/datetime/date_time_type_route.dart';
import 'package:myflutter/dialog/dialog_type_route.dart';
import 'package:myflutter/drag/drag_route.dart';
import 'package:myflutter/gesture_detector/gesture_detector_type_route.dart';
import 'package:myflutter/json/json_route.dart';
import 'package:myflutter/layout/align__route.dart';
import 'package:myflutter/layout/center_route.dart';
import 'package:myflutter/layout/constraint_route.dart';
import 'package:myflutter/layout/flex_route.dart';
import 'package:myflutter/layout/layout_builder_route.dart';
import 'package:myflutter/layout/layout_type_route.dart';
import 'package:myflutter/layout/row_column_route.dart';
import 'package:myflutter/layout/stack_route.dart';
import 'package:myflutter/layout/wrap_flow_route.dart';
import 'package:myflutter/net/net_route.dart';
import 'package:myflutter/others/other_type_route.dart';
import 'package:myflutter/platform_view_demo.dart';
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
import 'package:myflutter/simple/slider_route.dart';
import 'package:myflutter/simple/switch_radio_checkbox_route.dart';
import 'package:myflutter/simple/text_route.dart';
import 'simple/segmented_control_route.dart';
import 'package:myflutter/test_widget.dart';

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
      //Android任务栏名称
      title: 'Flutter学习',
      //国际化
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh'),
        Locale('en'),
      ],
      //App主题颜色
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //路由
      routes: {
        "/": (context) => const MyHomePage(title: '首页'),
        //测试组件
        "/first_page": (context) => FirstPage(),
        "/second_page": (context) => SecondPage(),
        "/third_page": (context) => ThirdPage(),
        "/fourth_page": (context) => FourthPage(),
        //布局组件
        "layout_route": (context) => LayoutPage(),
        "constraint_route": (context) => ConstraintPage(),
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
            const SnackBar(content: Text("再按一次退出程序")),
          );
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        //顶部导航栏
        appBar: AppBar(
          //页面标题
          title: Text(widget.title),
          //标题居中
          centerTitle: true,
          actions: [
            IconButton(icon: const Icon(Icons.share), onPressed: () {}),
          ],
        ),
        //抽屉菜单
        drawer: const MyDrawer(),
        //页面主体部分
        body: const MyBody(),
        //底部Tab导航栏
        bottomNavigationBar: MyBottomNavigationBar(),
        //悬浮按钮
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("点击了悬浮按钮")),
            );
          },
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

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
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipOval(
                      child: Image.asset(
                        "images/avatar.jpg",
                        width: 80,
                      ),
                    ),
                  ),
                  const Text(
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
                    leading: const Icon(Icons.looks_two),
                    title: const Text("跳转第二页"),
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
  const MyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 8,
          children: <Widget>[
            ElevatedButton(
              child: const Text("测试组件"),
              onPressed: () {
                // Navigator.pushNamed(context, "/first_page");
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return FirstPage();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("Text组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TextPage(),
                    settings: const RouteSettings(
                      arguments: {"name": "小明", "age": 18, "address": "beijing"},
                    ),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text("Button组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ButtonPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("图片组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ImagePage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("开关单选复选组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SwitchRadioCheckBoxPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("进度条组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProgressPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("Form组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("输入框组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InputPage()),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SliderPage()),
                );
              },
              child: const Text("Slider组件"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SegmentedControlPage()),
                );
              },
              child: const Text("分段控制组件"),
            ),
            ElevatedButton(
              child: const Text("Row组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RowPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("Column组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ColumnPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("弹性布局组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FlexPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("流式布局组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WrapFlowPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("层叠布局组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StackPage()),
                );
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
              child: const Text("动画组件"),
              onPressed: () {
                Navigator.pushNamed(context, "animation_type_page");
              },
            ),
            ElevatedButton(
              child: const Text("数据存储"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DataPage();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("网络请求"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NetPage();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("JSON解析"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return JsonPage();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("嵌入原生 Android View"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PlatformViewDemo();
                }));
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
