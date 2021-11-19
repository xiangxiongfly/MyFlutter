import 'package:flutter/material.dart';

class ShapePage extends StatelessWidget {
  const ShapePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("shape系列组件"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("BeveledRectangleBorder"),
                  shape: BeveledRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("BeveledRectangleBorder"),
                  shape: BeveledRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("BeveledRectangleBorder"),
                  shape: BeveledRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("Border"),
                  shape: Border(
                    top: BorderSide(color: Colors.red, width: 2),
                    bottom: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              Container(
                width: 120,
                height: 120,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("CircleBorder"),
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("ContinuousRectangleBorder"),
                  shape: ContinuousRectangleBorder(
                    side: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("RoundedRectangleBorder"),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("StadiumBorder"),
                  shape: StadiumBorder(
                    side: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("OutlineInputBorder"),
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("UnderlineInputBorder"),
                  shape: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
