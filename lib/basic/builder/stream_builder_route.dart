import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderPage extends StatefulWidget {
  const StreamBuilderPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {
  late StreamController<dynamic> _streamController;

  @override
  void initState() {
    _streamController = StreamController();
    super.initState();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StreamBuilder组件"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StreamBuilder(
              stream: _streamController.stream,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasError) {
                  return const Text("失败");
                } else {
                  if (snapshot.hasData) {
                    return Text("有数据 ${snapshot.data}");
                  } else {
                    return const Text("无数据");
                  }
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                _streamController.add("hello StreamBuilder");
              },
              child: const Text("发送数据"),
            ),
          ],
        ),
      ),
    );
  }
}
