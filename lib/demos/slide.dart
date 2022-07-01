import 'package:flutter/material.dart';
import 'package:myflutter/utils/snack_bar_utils.dart';

class SlidePage extends StatelessWidget {
  const SlidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("左滑删除"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            SlideDelete(),
          ],
        ),
      ),
    );
  }
}

class SlideDelete extends StatefulWidget {
  const SlideDelete({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SlideDeleteState();
  }
}

class _SlideDeleteState extends State<SlideDelete> {
  //确认删除吗
  bool delete = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.centerLeft,
        height: 70,
        child: Slide(
          actionsWidth: 100,
          child: _createItem(),
          actions: [
            _createDelete(),
          ],
        ),
      ),
    );
  }

  _createDelete() {
    return GestureDetector(
      onTap: () {
        if (delete) {
          //点击删除
          showSnackBar(context, "删除");
        } else {
          setState(() {
            delete = !delete;
          });
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 100,
        color: Colors.red,
        child: Text(delete ? "确认删除" : "删除"),
      ),
    );
  }

  Widget _createItem() {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(left: 4),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("左滑删除"),
            Icon(Icons.delete),
          ],
        ),
      ),
    );
  }
}

class Slide extends StatefulWidget {
  Key? key;
  List<Widget> actions = [];
  Widget child;
  final double actionsWidth;

  Slide({this.key, required this.actionsWidth, required this.child, required this.actions}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SlideState();
  }
}

class _SlideState extends State<Slide> with TickerProviderStateMixin {
  double translateX = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      lowerBound: -widget.actionsWidth,
      upperBound: 0,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        setState(() {
          translateX = _animationController.value;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: widget.actions,
          ),
        ),
        GestureDetector(
          onHorizontalDragUpdate: _onHorizontalDragUpdate,
          onHorizontalDragEnd: _onHorizontalDragEnd,
          child: Transform.translate(
            offset: Offset(translateX, 0),
            child: Row(
              children: [
                Expanded(child: widget.child, flex: 1),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      translateX = (translateX + details.delta.dx).clamp(-widget.actionsWidth, 0.0);
    });
  }

  _onHorizontalDragEnd(DragEndDetails details) {
    _animationController.value = translateX;
    if (details.velocity.pixelsPerSecond.dx > 200) {
      close();
    } else if (details.velocity.pixelsPerSecond.dx < -200) {
      open();
    } else {
      if (translateX.abs() > widget.actionsWidth / 2) {
        open();
      } else {
        close();
      }
    }
  }

  open() {
    if (translateX != -widget.actionsWidth) {
      _animationController.animateTo(-widget.actionsWidth);
    }
  }

  close() {
    if (translateX != 0) {
      _animationController.animateTo(0);
    }
  }
}
