import 'package:flutter/material.dart';

class AnimatedListPage extends StatefulWidget {
  const AnimatedListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AnimatedListPageState();
  }
}

class _AnimatedListPageState extends State<AnimatedListPage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  var data = <String>[];
  int counter = 5;

  @override
  void initState() {
    for (int i = 0; i < counter; i++) {
      data.add(i.toString());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedList"),
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: data.length,
        itemBuilder: (BuildContext context, int index, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: buildItem(context, index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          addItem();
        },
      ),
    );
  }

  Widget buildItem(BuildContext context, int index) {
    String c = data[index];
    return ListTile(
      key: ValueKey(c),
      title: Text(c),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          deleteItem(context, index);
        },
      ),
    );
  }

  void addItem() {
    data.add(counter.toString());
    counter++;
    _listKey.currentState!.insertItem(data.length - 1);
  }

  void deleteItem(BuildContext context, int index) {
    _listKey.currentState!.removeItem(
      index,
      (BuildContext context, Animation<double> animation) {
        var item = buildItem(context, index);
        data.removeAt(index);
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            //让透明度变化的更快一些
            curve: const Interval(0.5, 1.0),
          ),
          child: SizeTransition(
            sizeFactor: animation,
            axisAlignment: 0.0,
            child: item,
          ),
        );
      },
      duration: const Duration(milliseconds: 100),
    );
  }
}
