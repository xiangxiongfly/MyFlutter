import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView组件"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SimpleGridViewPage()),
                );
              },
              child: const Text("简单使用"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DataGridViewPage()),
                );
              },
              child: const Text("动态创建"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GridViewCountPage()),
                );
              },
              child: const Text("GridView.count"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GridViewExtentPage()),
                );
              },
              child: const Text("GridView.extent"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GridViewCustomPage()),
                );
              },
              child: const Text("GridView.custom"),
            ),
          ],
        ),
      ),
    );
  }
}

createItem(Color color) {
  return Container(
    color: color,
  );
}

class SimpleGridViewPage extends StatelessWidget {
  const SimpleGridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("简单使用"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 2,
        ),
        children: [
          createItem(Colors.red.shade300),
          createItem(Colors.red.shade200),
          createItem(Colors.red.shade100),
          createItem(Colors.green.shade300),
          createItem(Colors.green.shade200),
          createItem(Colors.green.shade100),
          createItem(Colors.blue.shade300),
          createItem(Colors.blue.shade200),
          createItem(Colors.blue.shade100),
        ],
      ),
    );
  }
}

class DataGridViewPage extends StatelessWidget {
  const DataGridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("动态创建"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return createItem(Colors.primaries[index % Colors.primaries.length]);
        },
        itemCount: 50,
      ),
    );
  }
}

class GridViewCountPage extends StatelessWidget {
  const GridViewCountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView.count"),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          50,
          (index) => createItem(Colors.primaries[index % Colors.primaries.length]),
        ),
      ),
    );
  }
}

class GridViewExtentPage extends StatelessWidget {
  const GridViewExtentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView.extent"),
      ),
      body: GridView.extent(
        maxCrossAxisExtent: 300,
        children: List.generate(
          50,
          (index) => createItem(Colors.primaries[index % Colors.primaries.length]),
        ),
      ),
    );
  }
}

class GridViewCustomPage extends StatelessWidget {
  const GridViewCustomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView.custom"),
      ),
      body: GridView.custom(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return createItem(Colors.primaries[index % Colors.primaries.length]);
          },
          childCount: 50,
        ),
      ),
    );
  }
}
