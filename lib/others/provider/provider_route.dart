import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterModel extends ChangeNotifier {
  int _count = 0;

  CounterModel(this._count);

  int get count => _count;

  void add() {
    _count++;
    notifyListeners();
  }
}

class ProviderFirstPage extends StatefulWidget {
  const ProviderFirstPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProviderFirstPageState();
}

class _ProviderFirstPageState extends State<ProviderFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider 第一页"),
      ),
      body: Center(
        child: Column(
          children: [
            //监听数据变化
            Text("${context.watch<CounterModel>().count}"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const ProviderSecondPage();
                  }),
                );
              },
              child: const Text("跳转第二页"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //修改数据
          context.read<CounterModel>().add();
        },
      ),
    );
  }
}

class ProviderSecondPage extends StatefulWidget {
  const ProviderSecondPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProviderSecondPageState();
}

class _ProviderSecondPageState extends State<ProviderSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider 第二页"),
      ),
      body: Center(
        child: Column(
          children: [
            //监听数据变化
            Text("${Provider.of<CounterModel>(context).count}"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("返回"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //修改数据
          Provider.of<CounterModel>(context, listen: false).add();
        },
      ),
    );
  }
}
