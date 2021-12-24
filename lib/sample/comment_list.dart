import 'package:flutter/material.dart';

class CommentListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CommentListPageState();
  }
}

class _CommentListPageState extends State<CommentListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("评论列表"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Item(index);
        },
        itemCount: 20,
      ),
    );
  }
}

class Item extends StatelessWidget {
  late int index;

  Item(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(2),
        child: FlatButton(
          onPressed: () {
            print("点击了");
          },
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "这是一堆评论$index",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  margin: EdgeInsets.all(6.0),
                  alignment: Alignment.topLeft,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      _getBottomItem(Icons.star, "1000"),
                      _getBottomItem(Icons.link, "1000"),
                      _getBottomItem(Icons.subject, "1000"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _getBottomItem(IconData icon, String text) {
  return Expanded(
    flex: 1,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 16,
            color: Colors.grey,
          ),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(color: Colors.grey, fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
