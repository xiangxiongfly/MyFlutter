import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedListPageState();
  }
}

class _AnimatedListPageState extends State<AnimatedListPage> {
  final _listKey = GlobalKey<AnimatedListState>();
  var data = <String>[];
  int counter = 5;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < counter; i++) {
      data.add("${i + 1}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedList"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              addItem();
            },
          ),
        ],
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: data.length,
        itemBuilder: (context, index, animation) {
          return buildItem(context, index);
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
    data.add("${++counter}");
    _listKey.currentState!.insertItem(data.length - 1);
  }

  void deleteItem(BuildContext context, int index) {
    _listKey.currentState!.removeItem(
      index,
      (BuildContext context, Animation<double> animation) {
        var item = buildItem(context, index);
        data.removeAt(index);
        return item;
      },
    );
  }
}
