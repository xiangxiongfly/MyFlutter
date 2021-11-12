import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String icons = "";
    icons += "\uE03e";
    icons += "\uE237";
    icons += "\uE287";
    icons += "home";
    return Scaffold(
        appBar: AppBar(
          title: Text("图片组件"),
        ),
        body: Column(
          children: [
            Image(
              color: Colors.black,
              image: AssetImage("images/pub.png"),
              width: 100,
              repeat: ImageRepeat.repeat,
            ),
            Image.asset(
              "images/logo.png",
              width: 100,
            ),
            Container(
              child: Image(
                image: NetworkImage(
                    "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png"),
                width: 100,
              ),
            ),
            Container(
              child: Image.network(
                "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png",
                width: 100,
              ),
            ),
            Text(
              icons,
              style: TextStyle(
                fontFamily: "MaterialIcons",
                fontSize: 24,
                color: Colors.blue,
              ),
            ),
            Row(
              children: [
                Icon(Icons.error, color: Colors.green),
                Icon(Icons.euro, color: Colors.green),
                Icon(Icons.event, color: Colors.green),
              ],
            ),
          ],
        ));
  }
}
