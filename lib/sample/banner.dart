import 'package:flutter/material.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BannerPageState();
  }
}

class _BannerPageState extends State<BannerPage> {
  List<String> titles = ["One", "Two", "Three"];
  List<Color> colors = [Colors.red, Colors.green, Colors.blue];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("轮播图")),
      body: Center(
        child: SizedBox(
          height: 250,
          child: Stack(
            children: [
              _buildItem(),
              _buildPoint(),
            ],
          ),
        ),
      ),
    );
  }

  _buildItem() {
    return PageView.builder(
      itemCount: 1000,
      itemBuilder: (BuildContext context, int index) {
        int realIndex = index % titles.length;
        Color color = colors[realIndex];
        String title = titles[realIndex];
        return Container(
          color: color,
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
      onPageChanged: (int index) {
        setState(() {
          currentIndex = index % titles.length;
        });
      },
    );
  }

  _buildPoint() {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          titles.length,
          (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentIndex == index
                    ? Colors.red.shade900
                    : Colors.grey.shade50,
              ),
            );
          },
        ),
      ),
    );
  }
}
