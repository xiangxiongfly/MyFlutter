import 'package:flutter/material.dart';
import 'package:myflutter/basic/animation/animation_curve_page.dart';
import 'package:myflutter/basic/animation/animation_multi2_page.dart';
import 'package:myflutter/basic/animation/animation_multi3_page.dart';
import 'package:myflutter/basic/animation/animation_multi_page.dart';
import 'package:myflutter/basic/animation/animation_scale_page.dart';
import 'package:myflutter/basic/animation/animation_tween_page.dart';

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
            RaisedButton(
              child: const Text("缩放动画"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return AnimationScalePage();
                }));
              },
            ),
            RaisedButton(
              child: const Text("区间动画"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return AnimationTweenPage();
                }));
              },
            ),
            RaisedButton(
              child: const Text("Curve"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return AnimationCurvePage();
                }));
              },
            ),
            RaisedButton(
              child: const Text("多动画混合使用"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return AnimationMultiPage();
                }));
              },
            ),
            RaisedButton(
              child: const Text("多动画混合使用2"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return AnimationMulti2Page();
                }));
              },
            ),
            RaisedButton(
              child: const Text("动画序列"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return AnimationMulti3Page();
                }));
              },
            ),
            RaisedButton(
              child: const Text("动画组件"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return ScaleTransitionPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}