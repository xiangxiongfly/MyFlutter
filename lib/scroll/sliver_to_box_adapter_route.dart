import 'package:flutter/material.dart';

class SliverToBoxAdapterPage extends StatelessWidget {
  const SliverToBoxAdapterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SliverToBoxAdapter"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              color: Colors.black26,
              alignment: Alignment.center,
              child: Text("hello world"),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: 60,
                  color: Colors.primaries[index % Colors.primaries.length],
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
