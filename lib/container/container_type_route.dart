import 'package:flutter/material.dart';

class ContainerTypePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("容器类组件"),
      ),
      body: Center(
        child: Column(
          children: [
            OutlinedButton(
              child: Text("FractionallySizedBox"),
              onPressed: () {
                Navigator.pushNamed(context, "fractionally_sized_box_route");
              },
            ),
            OutlinedButton(
              child: Text("AspectRatio"),
              onPressed: () {
                Navigator.pushNamed(context, "aspect_ratio_route");
              },
            ),
            OutlinedButton(
              child: Text("Transform"),
              onPressed: () {
                Navigator.pushNamed(context, "transform_route");
              },
            ),
            OutlinedButton(
              child: Text("Clip"),
              onPressed: () {
                Navigator.pushNamed(context, "clip_route");
              },
            ),
            OutlinedButton(
              child: Text("FittedBox"),
              onPressed: () {
                Navigator.pushNamed(context, "fitted_box_route");
              },
            )
          ],
        ),
      ),
    );
  }
}
