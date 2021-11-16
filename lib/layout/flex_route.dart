import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹性布局组件"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Flexible"),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                  Flexible(
                    // fit: FlexFit.loose,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.green,
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.green,
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Container(height: 50, color: Colors.red),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: Container(height: 50, color: Colors.green),
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.loose,
                    child: Container(height: 50, color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text("Expanded"),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(height: 50, color: Colors.red),
                  ),
                  Expanded(
                    child: Container(height: 50, color: Colors.green),
                  ),
                  Expanded(
                    child: Container(height: 50, color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text("Spacer"),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(width: 50, height: 50, color: Colors.red),
                  Spacer(),
                  Container(width: 50, height: 50, color: Colors.green),
                  Spacer(),
                  Container(width: 50, height: 50, color: Colors.blue),
                ],
              ),
              SizedBox(height: 10),
              Text("Flex & Expanded"),
              SizedBox(height: 10),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Container(width: 50, height: 50, color: Colors.grey),
                  Expanded(
                    flex: 1,
                    child: Container(height: 50, color: Colors.red),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(height: 50, color: Colors.green),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(height: 50, color: Colors.blue),
                  ),
                  Container(width: 50, height: 50, color: Colors.black12),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
