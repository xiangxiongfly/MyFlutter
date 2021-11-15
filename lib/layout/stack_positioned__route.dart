import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/layout/indexed_stack_route.dart';

class StackPositionedPage extends StatelessWidget {
  StackPositionedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("层叠布局组件"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SizedBox.expand(
          child: Stack(
            //设置未定位组件的对齐方式
            alignment: Alignment.center,
            //未定位的如何适应Stack空间
            fit: StackFit.loose,
            children: [
              Container(
                color: Colors.red,
                child: Text(
                  "hello world",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Positioned(
                child: Text("hello flutter"),
                left: 50,
              ),
              Positioned(
                child: Text("hello stack"),
                top: 50,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  child: Text("跳转IndexedStack"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return IndexedStackPage();
                      }),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 100,
                child: TextButton(
                  child: Text("跳转IndexedStack"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return IndexedStackPage();
                      }),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
