import 'package:flutter/material.dart';

class ShapePage extends StatelessWidget {
  const ShapePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("shape系列组件"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text("BeveledRectangleBorder"),
                  shape: BeveledRectangleBorder(
                    side: const BorderSide(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text("BeveledRectangleBorder"),
                  shape: BeveledRectangleBorder(
                    side: const BorderSide(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text("BeveledRectangleBorder"),
                  shape: BeveledRectangleBorder(
                    side: const BorderSide(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text("Border"),
                  shape: const Border(
                    top: BorderSide(color: Colors.red, width: 2),
                    bottom: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              SizedBox(
                width: 120,
                height: 120,
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text("CircleBorder"),
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
                  child: const Text("ContinuousRectangleBorder"),
                  shape: ContinuousRectangleBorder(
                    side: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text("RoundedRectangleBorder"),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text("StadiumBorder"),
                  shape: const StadiumBorder(
                    side: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text("OutlineInputBorder"),
                  shape: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text("UnderlineInputBorder"),
                  shape: const UnderlineInputBorder(
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
