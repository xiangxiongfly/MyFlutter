import 'package:flutter/material.dart';
import 'package:myflutter/demos/banner.dart';
import 'package:myflutter/navigation_page_route.dart';

class PageViewPage extends StatelessWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PageView组件"),
      ),
      body: Center(
        child: Column(
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SimplePageViewPage()),
                );
              },
              child: const Text("PageView简单使用"),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const XPageViewPage()),
                );
              },
              child: const Text("PageView无限滚动"),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PageViewNavigationBarPage()),
                );
              },
              child: const Text("PageView & BottomNavigationBar"),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BannerPage()),
                );
              },
              child: const Text("轮播图"),
            ),
          ],
        ),
      ),
    );
  }
}

class SimplePageViewPage extends StatefulWidget {
  const SimplePageViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SimplePageViewPageState();
  }
}

class _SimplePageViewPageState extends State<SimplePageViewPage> {
  @override
  Widget build(BuildContext context) {
    List<Page> pageList = [];
    for (int i = 0; i < Colors.primaries.length; i++) {
      pageList.add(Page(title: "$i", color: Colors.primaries[i]));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("PageView简单使用"),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        allowImplicitScrolling: true,
        pageSnapping: true,
        children: pageList,
        controller: PageController(viewportFraction: 0.8, initialPage: 1),
        onPageChanged: (index) {
          print("onPageChanged $index");
        },
      ),
    );
  }
}

class Page extends StatelessWidget {
  final String title;
  final Color color;

  const Page({Key? key, required this.title, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build $title");
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(title, textScaleFactor: 2),
    );
  }
}

class XPageViewPage extends StatelessWidget {
  const XPageViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> pageList = const [
      Page(title: "1", color: Colors.red),
      Page(title: "2", color: Colors.green),
      Page(title: "3", color: Colors.blue),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("PageView无限滚动"),
      ),
      body: PageView.builder(
        itemCount: 10000,
        itemBuilder: (BuildContext context, int index) {
          return pageList[index % pageList.length];
        },
      ),
    );
  }
}
