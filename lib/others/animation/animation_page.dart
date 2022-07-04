import 'package:flutter/material.dart';

import 'animation_curve_page.dart';
import 'animation_multi2_page.dart';
import 'animation_multi3_page.dart';
import 'animation_multi_page.dart';
import 'animation_simple_page.dart';
import 'animation_tween_page.dart';
import 'hero_route.dart';
import 'widget_scale_transition_page.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("动画组件")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text("基本使用"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return const AnimationSimplePage();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("区间动画"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return const AnimationTweenPage();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("Curve"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return AnimationCurvePage();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("多动画同时执行"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return const AnimationMultiPage();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("多动画依次执行"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return const AnimationMulti2Page();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("动画序列"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return const AnimationMulti3Page();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("动画组件"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return ScaleTransitionPage();
                }));
              },
            ),
            ElevatedButton(
              child: const Text("Hero"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return const HeroFirstPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
