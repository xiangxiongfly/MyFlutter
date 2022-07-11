import 'package:flutter/cupertino.dart';

/// 键盘占位
class KeyboardPlaceholderWidget extends StatefulWidget {
  //最大的占位
  final double minHeight;

  //最小的占位
  final double maxHeight;

  const KeyboardPlaceholderWidget({required this.minHeight, required this.maxHeight, Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _KeyboardPlaceholderWdget();
  }
}

class _KeyboardPlaceholderWdget extends State<KeyboardPlaceholderWidget>
    with WidgetsBindingObserver {
  late double currentHeight;
  late double minHeight;
  late double maxHeight = 0;

  @override
  void initState() {
    super.initState();
    //添加监听
    WidgetsBinding.instance.addObserver(this);
    minHeight = widget.minHeight;
    maxHeight = widget.maxHeight;
    currentHeight = maxHeight;
  }

  @override
  void dispose() {
    super.dispose();
    //解绑
    WidgetsBinding.instance.removeObserver(this);
  }

  //应用尺寸改变时回调
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    /*
     *Frame是一次绘制过程，称其为一帧，
     * Flutter engine受显示器垂直同步信号"VSync"的驱使不断的触发绘制，
     *Flutter可以实现60fps（Frame Per-Second），
     * 就是指一秒钟可以触发60次重绘，FPS值越大，界面就越流畅。
     */
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //注意，不要在此类回调中再触发新的Frame，这可以会导致循环刷新。
      setState(() {
        ///获取底部遮挡区域的高度
        double keyboderFlexHeight = MediaQuery.of(context).viewInsets.bottom;
        print("键盘的高度 keyboderFlexHeight $keyboderFlexHeight");
        if (MediaQuery.of(context).viewInsets.bottom == 0) {
          //关闭键盘 启动logo动画反向执行 0.0 -1.0
          // logo 布局区域显示出来
          setState(() {
            currentHeight = maxHeight;
          });
        } else {
          //显示键盘 启动logo动画正向执行 1.0-0.0
          // logo布局区域缩放隐藏
          setState(() {
            currentHeight = minHeight;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //动画容器 当height的值有变化时会触发动画
    return AnimatedContainer(
      //动画执行时间 为200毫秒
      duration: const Duration(milliseconds: 200),
      height: currentHeight,
      width: 1,
    );
  }
}
