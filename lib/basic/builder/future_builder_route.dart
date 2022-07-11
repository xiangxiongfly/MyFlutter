import 'package:flutter/material.dart';

class FutureBuilderPage extends StatefulWidget {
  const FutureBuilderPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FutureBuilderPageState();
  }
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  late Future<dynamic> _futureSuccess = Future.delayed(const Duration(seconds: 3), () {
    return "成功了";
  });
  late Future<dynamic> _futureError = Future.delayed(const Duration(seconds: 3), () {
    return Future.error("失败了");
  });

  String _msg = "加载中";
  String _msg2 = "加载中";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FutureBuilder组件"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FutureBuilder(
              future: _futureSuccess,
              builder: (context, snapshot) {
                late Widget widget;
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    widget = const Icon(Icons.error, color: Colors.red, size: 50);
                    _msg = snapshot.error.toString();
                  } else {
                    if (snapshot.hasData) {
                      _msg = snapshot.data.toString();
                    } else {
                      _msg = "无数据";
                    }
                    widget = const Icon(Icons.check_circle, color: Colors.green, size: 50);
                  }
                } else {
                  widget = const CircularProgressIndicator();
                  _msg = "加载中";
                }
                return Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        widget,
                        Text(_msg),
                      ],
                    ),
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _futureSuccess = Future.delayed(const Duration(seconds: 3), () {
                    return "成功了";
                  });
                });
              },
              child: const Text("发送成功数据"),
            ),
            const SizedBox(height: 10),
            FutureBuilder(
              future: _futureError,
              builder: (context, snapshot) {
                late Widget widget;
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    widget = const Icon(Icons.error, color: Colors.red, size: 50);
                    _msg2 = snapshot.error.toString();
                  } else {
                    widget = const Icon(Icons.check_circle, color: Colors.green, size: 50);
                    _msg2 = snapshot.data.toString();
                  }
                } else {
                  widget = const CircularProgressIndicator();
                  _msg2 = "加载中";
                }
                return Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        widget,
                        Text(_msg2),
                      ],
                    ),
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _futureError = Future.delayed(const Duration(seconds: 3), () {
                    return Future.error("失败了");
                  });
                });
              },
              child: const Text("发送失败数据"),
            ),
          ],
        ),
      ),
    );
  }
}
