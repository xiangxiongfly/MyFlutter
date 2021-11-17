import 'package:flutter/material.dart';

class NestedScrollViewPage extends StatelessWidget {
  const NestedScrollViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              toolbarHeight: 0,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              collapsedHeight: 0,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset("images/bird.jpg", fit: BoxFit.cover),
              ),
            ),
          ];
        },
        body: ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 80,
              color: Colors.primaries[index % Colors.primaries.length],
              alignment: Alignment.center,
              child: Text(
                "$index",
                style: TextStyle(color: Colors.white),
              ),
            );
          },
          itemCount: 30,
        ),
      ),
    );
  }
}
