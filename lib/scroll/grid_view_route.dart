import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView"),
      ),
      body: buildGridView5(),
    );
  }
}

GridView buildGridView1() {
  return GridView(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 1,
    ),
    children: const [
      Icon(Icons.home),
      Icon(Icons.add),
      Icon(Icons.delete),
      Icon(Icons.update),
      Icon(Icons.close),
      Icon(Icons.lock),
      Icon(Icons.home),
      Icon(Icons.add),
      Icon(Icons.delete),
      Icon(Icons.update),
      Icon(Icons.close),
      Icon(Icons.lock),
      Icon(Icons.home),
      Icon(Icons.add),
      Icon(Icons.delete),
      Icon(Icons.update),
      Icon(Icons.close),
      Icon(Icons.lock),
    ],
  );
}

GridView buildGridView2() {
  return GridView.count(
    crossAxisCount: 3,
    childAspectRatio: 1,
    children: [
      Icon(Icons.home),
      Icon(Icons.add),
      Icon(Icons.delete),
      Icon(Icons.update),
      Icon(Icons.close),
      Icon(Icons.lock),
      Icon(Icons.home),
    ],
  );
}

GridView buildGridView3() {
  return GridView(
    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 120,
      childAspectRatio: 1,
    ),
    children: const [
      Icon(Icons.home),
      Icon(Icons.add),
      Icon(Icons.delete),
      Icon(Icons.update),
      Icon(Icons.close),
      Icon(Icons.lock),
      Icon(Icons.home),
      Icon(Icons.add),
      Icon(Icons.delete),
      Icon(Icons.update),
      Icon(Icons.close),
      Icon(Icons.lock),
      Icon(Icons.home),
      Icon(Icons.add),
      Icon(Icons.delete),
      Icon(Icons.update),
      Icon(Icons.close),
      Icon(Icons.lock),
    ],
  );
}

GridView buildGridView4() {
  return GridView.extent(
    maxCrossAxisExtent: 120,
    children: const [
      Icon(Icons.delete),
      Icon(Icons.update),
      Icon(Icons.close),
      Icon(Icons.lock),
      Icon(Icons.home),
      Icon(Icons.add),
    ],
  );
}

MyGridView buildGridView5() {
  return MyGridView();
}

class MyGridView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyGridViewState();
  }
}

class _MyGridViewState extends State<MyGridView> {
  List<Icon> icons = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      itemCount: icons.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == icons.length - 1 && icons.length < 200) {
          getData();
        }
        return icons[index];
      },
    );
  }

  void getData() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        icons.addAll([
          Icon(Icons.delete),
          Icon(Icons.update),
          Icon(Icons.close),
          Icon(Icons.lock),
          Icon(Icons.home),
          Icon(Icons.add),
        ]);
      });
    });
  }
}
