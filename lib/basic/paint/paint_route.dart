import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PaintPage extends StatefulWidget {
  const PaintPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PaintPageState();
  }
}

class _PaintPageState extends State<PaintPage> with SingleTickerProviderStateMixin {
  final List<String> tabs = ["基本使用", "绘制path", "绘制文本", "绘制图片"];
  final List<Widget> pages = const [
    SimplePaintPage(),
    PathPaintPage(),
    TextPaintPage(),
    ImagePaintPage()
  ];
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("绘图"),
        bottom: TabBar(
          controller: _controller,
          isScrollable: true,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      backgroundColor: Colors.grey,
      body: TabBarView(
        dragStartBehavior: DragStartBehavior.down,
        controller: _controller,
        children: pages,
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////
class SimplePaintPage extends StatelessWidget {
  const SimplePaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text("绘制线"),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: Colors.white,
            child: CustomPaint(
              //定义画板大小
              size: const Size(200, 200),
              //配置画布
              painter: LinePainter(),
              //子节点，RepaintBoundary会创建一个新的图层layer，避免重复绘制
              child: const RepaintBoundary(
                child: Center(child: Text("hello world")),
              ),
            ),
          ),
          const Text("绘制点"),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: Colors.white,
            child: CustomPaint(
              size: const Size(200, 200),
              painter: PointPainter(),
            ),
          ),
          const Text("绘制矩形"),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: Colors.white,
            child: CustomPaint(
              size: const Size(200, 200),
              painter: RectPainter(),
            ),
          ),
          const Text("绘制圆角矩形"),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: Colors.white,
            child: CustomPaint(
              size: const Size(200, 200),
              painter: RRectPainter(),
            ),
          ),
          const Text("绘制圆形"),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: Colors.white,
            child: CustomPaint(
              size: const Size(200, 200),
              painter: CirclePainter(),
            ),
          ),
          const Text("绘制椭圆"),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: Colors.white,
            child: CustomPaint(
              size: const Size(200, 200),
              painter: OvalPainter(),
            ),
          ),
          const Text("绘制弧"),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: Colors.white,
            child: CustomPaint(
              size: const Size(200, 200),
              painter: ArcPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  //定义画笔：画笔颜色、画笔宽度
  final Paint _paint = Paint()
    ..color = Colors.blue
    ..strokeWidth = 4;

  /// 绘制流程
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(const Offset(20, 20), const Offset(100, 100), _paint);
  }

  /// 刷新是是否重绘
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class PointPainter extends CustomPainter {
  final Paint _paint = Paint()
    //画笔颜色
    ..color = Colors.blue
    //画笔笔头样式
    ..strokeCap = StrokeCap.round
    //抗锯齿
    ..isAntiAlias = true
    //填充样式
    ..style = PaintingStyle.fill
    //画笔宽度
    ..strokeWidth = 20;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPoints(
        ui.PointMode.points,
        [
          const Offset(50, 50),
          const Offset(100, 150),
          const Offset(150, 150),
        ],
        _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RectPainter extends CustomPainter {
  final Paint _paint = Paint()
    ..color = Colors.blueAccent
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..style = PaintingStyle.fill
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    //方式一：设置左上右下4个顶点
    // Rect rect = const Rect.fromLTRB(20, 40, 150, 100);
    //方式二：设置2左上2个顶点和宽高
    // Rect rect = const Rect.fromLTWH(20, 40, 150, 100);
    //方式三：设置圆心和半径
    // Rect rect = Rect.fromCircle(center: const Offset(100, 100), radius: 50);
    //方式四：设置圆心和宽高
    Rect rect = Rect.fromCenter(center: const Offset(100, 100), width: 100, height: 100);
    canvas.drawRect(rect, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RRectPainter extends CustomPainter {
  final Paint _paint = Paint()
    ..color = Colors.blueAccent
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..style = PaintingStyle.fill
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromCenter(center: const Offset(100, 100), width: 100, height: 100);
    RRect rRect = RRect.fromRectAndRadius(rect, const Radius.circular(20));
    canvas.drawRRect(rRect, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CirclePainter extends CustomPainter {
  final Paint _paint = Paint()
    ..color = Colors.blueAccent
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(const Offset(100, 100), 40, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class OvalPainter extends CustomPainter {
  final Paint _paint = Paint()
    ..color = Colors.blueAccent
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromCenter(center: const Offset(150, 100), width: 200, height: 100);
    canvas.drawOval(rect, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ArcPainter extends CustomPainter {
  final Paint _paint = Paint()
    ..color = Colors.blueAccent
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    const Rect rect = Rect.fromLTRB(50, 50, 150, 150);
    //参数依次是：矩形范围、开始弧度、结束弧度、是否连接圆心、画笔
    canvas.drawArc(rect, 0, 2, false, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

///////////////////////////////////////////////////////////////////////////////////////////
class PathPaintPage extends StatelessWidget {
  const PathPaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("绘制path"),
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.white,
          child: CustomPaint(
            size: const Size(200, 200),
            painter: PathPainter(),
          ),
        ),
        const Text("绘制path2"),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          color: Colors.white,
          child: CustomPaint(
            size: const Size(200, 200),
            painter: PathPainter2(),
          ),
        ),
      ],
    );
  }
}

class PathPainter extends CustomPainter {
  final Paint _paint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();
    path.moveTo(100, 80);
    path.lineTo(100, 150);
    path.lineTo(160, 150);
    path.close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PathPainter2 extends CustomPainter {
  final Paint _paint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();
    path.moveTo(100, 80);
    path.lineTo(200, 80);
    path.addArc(
      Rect.fromCenter(center: const Offset(150, 80), width: 100, height: 100),
      0,
      0.5 * pi,
    );
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

///////////////////////////////////////////////////////////////////////////////////////////
class TextPaintPage extends StatelessWidget {
  const TextPaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("绘制文本"),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          color: Colors.white,
          child: CustomPaint(
            size: const Size(200, 200),
            painter: TextPainter(),
          ),
        ),
      ],
    );
  }
}

class TextPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    ui.ParagraphBuilder builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        //文字方向
        textDirection: TextDirection.ltr,
        //最大行数
        maxLines: 2,
        //文本居中
        textAlign: TextAlign.center,
        //字体加粗
        fontWeight: FontWeight.bold,
        //字体样式
        fontStyle: FontStyle.normal,
        //字体大小
        fontSize: 24,
        //超出范围显示内容
        ellipsis: "...",
        //行间距
        height: 1.2,
        textHeightBehavior: const TextHeightBehavior(
          applyHeightToFirstAscent: true,
          applyHeightToLastDescent: true,
        ),
      ),
    );
    //设置文字样式
    builder.pushStyle(ui.TextStyle(
      color: Colors.red,
      fontSize: 20,
      height: 1,
      fontWeight: FontWeight.w500,
    ));
    String text = "床前明月光，疑是地上霜；举头望明月，低头思故乡。";
    builder.addText(text);
    //文本绘制最大宽度
    ui.ParagraphConstraints constraints = const ui.ParagraphConstraints(width: 300);
    ui.Paragraph paragraph = builder.build()..layout(constraints);
    //绘制文字
    canvas.drawParagraph(paragraph, const Offset(40, 40));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

///////////////////////////////////////////////////////////////////////////////////////////
class ImagePaintPage extends StatefulWidget {
  const ImagePaintPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImagePaintPageState();
}

class _ImagePaintPageState extends State<ImagePaintPage> {
  ui.Image? _image;

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  loadImage() async {
    // _image = await loadImageByAssets();
    _image = await loadImageByNet();
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("绘制图片"),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          color: Colors.white,
          child: Center(
            child: Stack(
              children: [
                _image == null
                    ? const CircularProgressIndicator()
                    : CustomPaint(
                        size: const Size(200, 200),
                        painter: ImagePainter(_image!),
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// 加载Assets图片
  Future<ui.Image> loadImageByAssets() async {
    AssetImage assetImage = const AssetImage("assets/images/bird.jpg");
    Completer<ui.Image> completer = Completer();
    ImageStream imageStream = assetImage.resolve(ImageConfiguration.empty);
    late ImageStreamListener listener;
    listener = ImageStreamListener((ImageInfo imageInfo, bool synchronousCall) {
      final ui.Image image = imageInfo.image;
      completer.complete(image);
      imageStream.removeListener(listener);
    });
    imageStream.addListener(listener);
    return completer.future;
  }

  /// 加载网络图片
  Future<ui.Image> loadImageByNet() async {
    String imageUrl = "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png";
    NetworkImage networkImage = NetworkImage(imageUrl);
    Completer<ui.Image> completer = Completer();
    ImageStream imageStream = networkImage.resolve(ImageConfiguration.empty);
    late ImageStreamListener listener;
    listener = ImageStreamListener((ImageInfo imageInfo, bool synchronousCall) {
      final ui.Image image = imageInfo.image;
      completer.complete(image);
      imageStream.removeListener(listener);
    });
    imageStream.addListener(listener); //添加监听
    return completer.future;
  }
}

class ImagePainter extends CustomPainter {
  final Paint _paint = Paint()..isAntiAlias = true;

  final ui.Image _image;

  ImagePainter(this._image);

  @override
  void paint(Canvas canvas, Size size) {
    //原图区域，一般传原图的宽高
    Rect src = const Offset(0.0, 0.0) & Size(_image.width.toDouble(), _image.height.toDouble());
    //目标显示区域
    Rect dst = const Offset(0.0, 0.0) & const Size(200, 200);
    canvas.drawImageRect(_image, src, dst, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
