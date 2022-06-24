import 'package:flutter/material.dart';

class KeepAlivePage extends StatefulWidget {
  const KeepAlivePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _KeepAlivePageState();
  }
}

class _KeepAlivePageState extends State<KeepAlivePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> pageList = [];
    // for (int i = 0; i < 5; i++) {
    //   pageList.add(ItemPage(title: i.toString()));
    // }
    for (int i = 0; i < 5; i++) {
      pageList.add(KeepAliveWrapper(child: ItemPage2(title: i.toString())));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("AutomaticKeepAlive缓存组件"),
      ),
      body: PageView(
        children: pageList,
      ),
    );
  }
}

class ItemPage extends StatefulWidget {
  final String title;

  const ItemPage({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ItemPage();
  }
}

class _ItemPage extends State<ItemPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    print("build ${widget.title}");
    return Center(child: Text(widget.title));
  }

  @override
  bool get wantKeepAlive => false; //是否缓存
}

class ItemPage2 extends StatelessWidget {
  final String title;

  const ItemPage2({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("ItemPage2 build $title");
    return Center(child: Text(title));
  }
}

class KeepAliveWrapper extends StatefulWidget {
  final bool keepAlive;
  final Widget child;

  const KeepAliveWrapper({Key? key, this.keepAlive = true, required this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _KeepAliveWrapperState();
  }
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  void didUpdateWidget(covariant KeepAliveWrapper oldWidget) {
    //状态发生变化时调用
    if (oldWidget.keepAlive != widget.keepAlive) {
      //更新KeepAlive状态
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
