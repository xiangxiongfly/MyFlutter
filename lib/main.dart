import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myflutter/demos/banner.dart';
import 'package:myflutter/others/sqlite/sqlite_route.dart';
import 'package:myflutter/platform_view_demo.dart';
import 'package:myflutter/second.dart';
import 'package:myflutter/test_route_widget.dart';
import 'package:myflutter/utils/sp_utils.dart';
import 'package:provider/provider.dart';

import 'basic/animation/animation_page.dart';
import 'basic/builder/builder_route.dart';
import 'basic/builder/future_builder_route.dart';
import 'basic/container/clip_route.dart';
import 'basic/container/constraint_route.dart';
import 'basic/container/container_route.dart';
import 'basic/container/container_type_route.dart';
import 'basic/container/fitted_box_route.dart';
import 'basic/container/transform_route.dart';
import 'basic/datetime/date_time_type_route.dart';
import 'basic/dialog/dialog_route.dart';
import 'basic/drag/drag_route.dart';
import 'basic/layout/align__route.dart';
import 'basic/layout/flex_route.dart';
import 'basic/layout/layout_builder_route.dart';
import 'basic/layout/padding_margin_route.dart';
import 'basic/layout/row_column_route.dart';
import 'basic/layout/stack_route.dart';
import 'basic/layout/wrap_flow_route.dart';
import 'basic/menu/menu_route.dart';
import 'basic/scroll/custom_scroll_view_route.dart';
import 'basic/scroll/grid_view_route.dart';
import 'basic/scroll/list_view_route.dart';
import 'basic/scroll/notification_listener_route.dart';
import 'basic/scroll/page_view_route.dart';
import 'basic/scroll/scroll_type_route.dart';
import 'basic/scroll/scroll_view_route.dart';
import 'basic/scroll/tabbarview_route.dart';
import 'basic/shape/shape_route.dart';
import 'basic/simple/button_route.dart';
import 'basic/simple/card_route.dart';
import 'basic/simple/form_route.dart';
import 'basic/simple/image_route.dart';
import 'basic/simple/input_route.dart';
import 'basic/simple/keep_alive_route.dart';
import 'basic/simple/progress_route.dart';
import 'basic/simple/segmented_control_route.dart';
import 'basic/simple/slider_route.dart';
import 'basic/simple/switch_radio_checkbox_route.dart';
import 'basic/simple/table_route.dart';
import 'basic/simple/text_route.dart';
import 'demos/comment_list.dart';
import 'demos/login.dart';
import 'navigation_page_route.dart';
import 'others/data/data_route.dart';
import 'others/gesture_detector/gesture_type_route.dart';
import 'others/json/json_route.dart';
import 'others/net/net_route.dart';
import 'others/provider/provider_route.dart';
import 'others/sp/sp_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtils.getInstance();
  // runApp(
  //   ChangeNotifierProvider(
  //     create: (context) => CounterModel(0),
  //     child: const MyApp(),
  //   ),
  // );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterModel(0)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //隐藏debug角标
      debugShowCheckedModeBanner: true,
      //Android任务栏中的名称
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
        "/": (context) => const MyBody(title: '我的Flutter'),
        //测试组件
        "first_page": (context) => const FirstPage(),
        "second_page": (context) => const SecondPage(),
        "third_page": (context) => const ThirdPage(),
        "fourth_page": (context) => const FourthPage(),
        //容器类组件
        "container_type_route": (context) => ContainerTypePage(),
        "transform_route": (context) => const TransformPage(),
        //滚动组件
        "scroll_type_route": (context) => ScrollTypePage(),
        "scroll_view_route": (context) => SingleChildScrollViewPage(),
        "notification_listener_route": (context) => NotificationListenerPage(),
        "custom_scroll_view_route": (context) => CustomScrollViewPage(),
        //动画组件
        "animation_type_page": (context) => const AnimationPage(),
      },
      initialRoute: "/",
    );
  }
}

const List<Widget> pages = [HomePage(), MessagePage(), SettingPage()];

int _selectedIndex = 0;

class MyBody extends StatefulWidget {
  final String title;

  const MyBody({Key? key, required this.title}) : super(key: key);

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  DateTime? lastTime;
  final PageController _controller = PageController(
    initialPage: _selectedIndex,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        appBar: buildAppBar(),
        //抽屉菜单
        drawer: buildDrawer(),
        //页面主体部分
        body: PageView(
          children: pages,
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        //底部导航栏
        bottomNavigationBar: buildBottomNavigationBar(),
        //悬浮按钮
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: buildFloatingActionButton(),
      ),
    );
  }

  /// 创建AppBar
  buildAppBar() {
    return AppBar(
      //页面标题
      title: Text(widget.title),
      //标题居中
      centerTitle: true,
      actions: [
        IconButton(icon: const Icon(Icons.share), onPressed: () {}),
      ],
    );
  }

  /// 创建左侧滑抽屉
  buildDrawer() {
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
                          return const NextPage();
                        }),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.navigation_sharp),
                    title: const Text("BottomNavigationBar"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const BottomNavigationBarPage();
                        }),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.close),
                    title: const Text("关闭抽屉菜单"),
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

  /// 创建底部导航栏
  buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: "message"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings"),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          _controller.jumpToPage(_selectedIndex);
        });
      },
    );
  }

  /// 创建悬浮按钮
  buildFloatingActionButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("点击了悬浮按钮")),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 2,
          runSpacing: 1,
          children: <Widget>[
            ElevatedButton(
              child: const Text("测试路由"),
              onPressed: () {
                Navigator.pushNamed(context, "first_page");
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
              child: const Text("相对定位布局组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AlignPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("内外边距组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaddingMarginPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("Container组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContainerPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("尺寸限制类容器组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ConstraintPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("LayoutBuilder组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LayoutBuilderPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("ListView组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListViewPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("GridView组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GridViewPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("PageView组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PageViewPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("TabBarView组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TabBarViewPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("弹窗组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DialogPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("表格组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TablePage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("Card组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CardPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("AutomaticKeepAlive缓存组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const KeepAlivePage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("Clip剪裁组件"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ClipPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("shape组件"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ShapePage();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("Builder组件"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const BuilderPage();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("FutureBuilder组件"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FutureBuilderPage();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("FittedBox组件"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FittedBoxPage();
                }));
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
              child: const Text("日期时间组件"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const DateTimeTypePage();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("菜单组件"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MenuPage();
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
          ],
        ),
      ),
    );
  }
}

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 2,
        children: [
          ElevatedButton(
            child: const Text("Provider状态管理"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProviderFirstPage()),
              );
            },
          ),
          ElevatedButton(
            child: const Text("shared_preferences"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SpPage()),
              );
            },
          ),
          ElevatedButton(
            child: const Text("文件存储"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DataPage();
              }));
            },
          ),
          ElevatedButton(
            child: const Text("SQLite"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SqlitePage();
              }));
            },
          ),
          ElevatedButton(
            child: const Text("网络请求"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const NetPage();
              }));
            },
          ),
          ElevatedButton(
            child: const Text("JSON解析"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const JsonPage();
              }));
            },
          ),
          ElevatedButton(
            child: const Text("手势事件处理"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const GestureTypePage();
              }));
            },
          ),
          ElevatedButton(
            child: const Text("嵌入原生 Android View"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const PlatformViewDemo();
              }));
            },
          ),
        ],
      ),
    );
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 2,
        children: [
          ElevatedButton(
            child: const Text("评论列表"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CommentListPage()),
              );
            },
          ),
          ElevatedButton(
            child: const Text("轮播图"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BannerPage()),
              );
            },
          ),
          ElevatedButton(
            child: const Text("QQ登陆界面"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          )
        ],
      ),
    );
  }
}
