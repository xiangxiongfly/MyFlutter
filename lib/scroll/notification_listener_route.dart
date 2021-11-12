import 'package:flutter/material.dart';

class NotificationListenerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationListenerPageState();
  }
}

class _NotificationListenerPageState extends State<NotificationListenerPage> {
  String _progress = "0%";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("滚动监听")),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            var extentBefore = notification.metrics.extentBefore;
            var extentInside = notification.metrics.extentInside;
            var extentAfter = notification.metrics.extentAfter;
            var pixels = notification.metrics.pixels;
            var maxScrollExtent = notification.metrics.maxScrollExtent;
            print("$extentBefore  ===  $extentInside  ===   $extentAfter");
            print("$pixels  ---  $maxScrollExtent");

            double progress = pixels / maxScrollExtent;
            setState(() => _progress = "${(progress * 100).toInt()}%");
            return false;
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              ListView.builder(
                itemCount: 100,
                itemExtent: 50,
                itemBuilder: (context, index) => ListTile(
                  title: Text("$index"),
                ),
              ),
              CircleAvatar(
                radius: 30,
                child: Text(_progress),
                backgroundColor: Colors.transparent.withAlpha(200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
