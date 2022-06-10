import 'package:flutter/material.dart';

class LayoutBuilderPage extends StatelessWidget {
  const LayoutBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LayoutBuilder组件"),
      ),
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        var a=constraints.maxWidth;
        var b=constraints.maxHeight;
        print("==============");
        print(a);
        print(b);

        Color color = Colors.red;
        if (constraints.maxWidth > 360) {
          color = Colors.blue;
        }
        return Container(
          width: 50,
          height: 50,
          color: color,
        );
      }),
    );
  }
}

//
// class LayoutBuilderRoute extends StatelessWidget {
//   const LayoutBuilderRoute({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var _children = List.filled(6, const Text("A"));
//     return Column(
//       children: [
//         SizedBox(
//             width: 190,
//             child: ChangeColumn(
//               children: _children,
//             )),
//         ChangeColumn(children: _children),
//       ],
//     );
//   }
// }
//
// class ChangeColumn extends StatelessWidget {
//   final List<Widget> children;
//
//   const ChangeColumn({Key? key, required this.children}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         if (constraints.maxWidth < 200) {
//           return Column(
//             children: children,
//             mainAxisSize: MainAxisSize.min,
//           );
//         } else {
//           var _children = <Widget>[];
//           for (int i = 0; i < children.length; i += 2) {
//             if (i + 1 < children.length) {
//               _children.add(Row(
//                 children: [children[i], children[i + 1]],
//                 mainAxisSize: MainAxisSize.min,
//               ));
//             } else {
//               _children.add(children[i]);
//             }
//           }
//           return Column(
//             children: _children,
//             mainAxisSize: MainAxisSize.min,
//           );
//         }
//       },
//     );
//   }
// }
