import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String icons = "";
    icons += "\uE03e";
    icons += "\uE237";
    icons += "\uE287";
    icons += "home";
    return Scaffold(
      appBar: AppBar(
        title: const Text("图片组件"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              const Text("加载本地图片1："),
              const Image(
                color: Colors.black,
                image: AssetImage("images/pub.png"),
                width: 100,
                repeat: ImageRepeat.repeat,
              ),
              const Text("加载本地图片2："),
              Image.asset(
                "images/logo.png",
                width: 100,
              ),
              const SizedBox(height: 20),
              const Text("加载网络图片1："),
              const Image(
                image: NetworkImage(
                    "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png"),
                width: 100,
              ),
              const Text("加载网络图片2："),
              Image.network(
                "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png",
                width: 100,
              ),
              const SizedBox(height: 20),
              const Text("淡入淡出动画效果"),
              Image.network(
                "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png",
                width: 100,
                frameBuilder: (
                  BuildContext context,
                  Widget child,
                  int? frame,
                  bool wasSynchronouslyLoaded,
                ) {
                  if (wasSynchronouslyLoaded) {
                    return child;
                  } else {
                    return AnimatedOpacity(
                      opacity: frame == null ? 0 : 1,
                      duration: const Duration(seconds: 2),
                      child: child,
                      curve: Curves.easeOut,
                    );
                  }
                },
              ),
              const Text("loading效果"),
              Image.network(
                "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png",
                width: 100,
                loadingBuilder: (
                  BuildContext context,
                  Widget child,
                  ImageChunkEvent? loadingProgress,
                ) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              const Text("圆形头像带边框"),
              Container(
                width: 100,
                height: 100,
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://img1.baidu.com/it/u=1235679188,872295587&fm=26&fmt=auto",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text("图片占位符"),
              Image.network(
                "https://img1.baidu.com/it/u=1235679188,872295587&fm=26&fmt=auto",
                width: 100,
                fit: BoxFit.cover,
                //加载中占位
                frameBuilder: (
                  BuildContext context,
                  Widget child,
                  int? frame,
                  bool wasSynchronouslyLoaded,
                ) {
                  if (frame == null) {
                    return Image.asset("images/logo.png", width: 100);
                  } else {
                    return child;
                  }
                },
                //加载失败占位
                errorBuilder: (
                  BuildContext context,
                  Object error,
                  StackTrace? stackTrace,
                ) {
                  return Image.asset("images/user.png", width: 100);
                },
              ),
              Text(
                icons,
                style: const TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 24,
                  color: Colors.blue,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.error, color: Colors.green),
                  Icon(Icons.euro, color: Colors.green),
                  Icon(Icons.event, color: Colors.green),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(IconData(0xe678, fontFamily: "myIcon")),
                  SizedBox(width: 10),
                  Icon(IconData(0xe679, fontFamily: "myIcon")),
                  SizedBox(width: 10),
                  Icon(IconData(0xe69c, fontFamily: "myIcon")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
