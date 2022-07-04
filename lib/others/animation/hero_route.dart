import 'package:flutter/material.dart';

class HeroFirstPage extends StatefulWidget {
  const HeroFirstPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HeroFirstPageState();
  }
}

class _HeroFirstPageState extends State<HeroFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("第一页"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 3,
        ),
        children: List.generate(10, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(seconds: 2),
                  pageBuilder: (BuildContext context, animation, secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: const HeroSecondPage(),
                    );
                  },
                ),
              );
            },
            child: Hero(
              tag: "hero",
              child: Container(
                color: Colors.redAccent,
                child: Image.asset(
                  'images/logo.png',
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class HeroSecondPage extends StatelessWidget {
  const HeroSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("第二页"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Hero(
          tag: "hero",
          child: Image.asset(
            'images/logo.png',
          ),
        ),
      ),
    );
  }
}
