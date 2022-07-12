import 'package:flutter/material.dart';
import 'anim_lib/shake_animation_controller.dart';
import 'anim_lib/shake_animation_type.dart';
import 'anim_lib/shake_animation_widget.dart';

/// 抖动的输入框
class ShakeTextFiled extends StatefulWidget {
  final String labelText;
  final Stream<dynamic> stream;
  final ShakeAnimationController shakeAnimationController;
  final FocusNode focusNode;
  final TextEditingController textFieldController;
  final Function(String value) onSubmitted;

  const ShakeTextFiled(
      {Key? key,
      required this.labelText,
      required this.stream,
      required this.shakeAnimationController,
      required this.focusNode,
      required this.textFieldController,
      required this.onSubmitted})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShakeTextFiled();
  }
}

class _ShakeTextFiled extends State<ShakeTextFiled> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
      stream: widget.stream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ShakeAnimationWidget(
          //微左右的抖动
          shakeAnimationType: ShakeAnimationType.LeftRightShake,
          //设置不开启抖动
          isForward: false,
          //抖动控制器
          shakeAnimationController: widget.shakeAnimationController,
          child: TextField(
            //焦点控制
            focusNode: widget.focusNode,
            //文本控制器
            controller: widget.textFieldController,
            //键盘回车键点击回调
            onSubmitted: widget.onSubmitted,
            //边框样式设置
            decoration: InputDecoration(
              labelText: widget.labelText,
              //红色的错误提示文本
              errorText: snapshot.data == null ? null : snapshot.data!,
              //设置上下左右 都有边框
              //设置四个角的弧度
              border: OutlineInputBorder(
                //设置边框四个角的弧度
                borderRadius: BorderRadius.circular(4),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
          ),
        );
      },
    );
  }
}
