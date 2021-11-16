import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView"),
      ),
      body: buildGridView3(),
    );
  }
}

GridView buildGridView1() {
  return GridView(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
    children: const [
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
      maxCrossAxisExtent: 100,
    ),
    children: [
      Container(
        height: 50,
        width: 50,
        color: Colors.red,
      ),
      Container(
        height: 50,
        width: 50,
        color: Colors.green,
      ),
      Container(
        height: 50,
        width: 50,
        color: Colors.blue,
      ),
      Container(
        height: 50,
        width: 50,
        color: Colors.green,
      ),
      Container(
        height: 50,
        width: 50,
        color: Colors.indigo,
      ),
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

GridView buildGridView5() {
  return GridView.builder(
    itemCount: 50,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 1,
    ),
    itemBuilder: (BuildContext context, int index) {
      return index % 2 == 0 ? Icon(Icons.delete) : Icon(Icons.add);
    },
  );
}

GridView buildGridView6() {
  return GridView.custom(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
    ),
    childrenDelegate: SliverChildBuilderDelegate(
      (context, index) {
        return Container(
          height: 80,
          color: Colors.primaries[index % Colors.primaries.length],
        );
      },
      childCount: 50,
    ),
  );
}
