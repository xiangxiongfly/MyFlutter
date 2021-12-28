import 'package:flutter/material.dart';
import 'package:myflutter/animation/animation_curve_page.dart';
import 'package:myflutter/animation/animation_scale_page.dart';
import 'package:myflutter/animation/animation_tween_page.dart';

class AnimationTypePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("动画组件")),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              child: Text("缩放动画"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return AnimationScalePage();
                }));
              },
            ),
            RaisedButton(
              child: Text("区间动画"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return AnimationTweenPage();
                }));
              },
            ),
            RaisedButton(
              child: Text("Curve"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return AnimationCurvePage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}