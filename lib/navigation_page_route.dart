import 'package:flutter/material.dart';

class BottomNavigationBarPage extends StatelessWidget {
  const BottomNavigationBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BottomNavigationBar")),
      body: Center(
        child: Column(
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const NavigationBarPage3();
                  }),
                );
              },
              child: const Text("NavigationBar"),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const PageViewNavigationBarPage();
                  }),
                );
              },
              child: const Text("NavigationBar & PageView"),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const NavigationBarPage2();
                  }),
                );
              },
              child: const Text("NavigationBar & IndexedStack"),
            ),
          ],
        ),
      ),
    );
  }
}

int _index = 1;
List<Widget> pages = const [OnePage(), TwoPage(), ThreePage()];

class PageViewNavigationBarPage extends StatefulWidget {
  const PageViewNavigationBarPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PageViewNavigationBarPageState();
  }
}

class _PageViewNavigationBarPageState extends State<PageViewNavigationBarPage> {
  final PageController _controller = PageController(
    initialPage: _index,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BottomNavigationBar & PageView")),
      body: PageView(
        children: pages,
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _index = index;
          });
        },
        // physics: const NeverScrollableScrollPhysics(), //禁止滑动
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.one_k), label: "One"),
          BottomNavigationBarItem(icon: Icon(Icons.two_k), label: "Two"),
          BottomNavigationBarItem(icon: Icon(Icons.three_k), label: "Three"),
        ],
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}

class NavigationBarPage2 extends StatefulWidget {
  const NavigationBarPage2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NavigationBarPage1State2();
  }
}

class _NavigationBarPage1State2 extends State<NavigationBarPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BottomNavigationBar & IndexedStack")),
      body: IndexedStack(
        children: pages,
        index: _index,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.one_k), label: "One"),
          BottomNavigationBarItem(icon: Icon(Icons.two_k), label: "Two"),
          BottomNavigationBarItem(icon: Icon(Icons.three_k), label: "Three"),
        ],
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}

class NavigationBarPage3 extends StatefulWidget {
  const NavigationBarPage3({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NavigationBarPage1State3();
  }
}

class _NavigationBarPage1State3 extends State<NavigationBarPage3> {
  Widget _currentPage = pages[_index];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BottomNavigationBar3")),
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.one_k), label: "One"),
          BottomNavigationBarItem(icon: Icon(Icons.two_k), label: "Two"),
          BottomNavigationBarItem(icon: Icon(Icons.three_k), label: "Three"),
        ],
        onTap: (index) {
          setState(() {
            _index = index;
            _currentPage = pages[_index];
          });
        },
      ),
    );
  }
}

class OnePage extends StatelessWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build 1 ${DateTime.now()}");
    return const Center(child: Text("One"));
  }
}

class TwoPage extends StatelessWidget {
  const TwoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build 2 ${DateTime.now()}");
    return const Center(child: Text("Two"));
  }
}

class ThreePage extends StatelessWidget {
  const ThreePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build 3 ${DateTime.now()}");
    return const Center(child: Text("Three"));
  }
}
