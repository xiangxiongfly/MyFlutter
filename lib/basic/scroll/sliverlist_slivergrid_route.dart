import 'package:flutter/material.dart';

class SliverListSliverGridPage extends StatelessWidget {
  const SliverListSliverGridPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SliverList+SliverGrid"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 50,
                  color: Colors.primaries[index % Colors.primaries.length],
                );
              },
              childCount: 5,
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: Colors.primaries[index % Colors.primaries.length],
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
