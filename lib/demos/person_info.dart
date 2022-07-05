import 'package:flutter/material.dart';

class PersonInfoPage extends StatelessWidget {
  const PersonInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("个人信息"),
      ),
      body: Column(
        children: const [
          SettingItem(
            iconData: Icons.notifications,
            iconColor: Colors.blue,
            title: "消息中心",
            suffix: NotificationText(
              text: '1',
            ),
          ),
          Divider(),
          SettingItem(
            iconData: Icons.follow_the_signs,
            iconColor: Colors.blue,
            title: "点赞",
            suffix: NotificationText(
              text: '2',
            ),
          ),
          Divider(),
          SettingItem(
            iconData: Icons.mark_chat_read,
            iconColor: Colors.blue,
            title: "阅读",
            suffix: Suffix(
              text: '200',
            ),
          ),
          Divider(),
          SettingItem(
            iconData: Icons.collections,
            iconColor: Colors.blue,
            title: "收藏",
            suffix: Suffix(
              text: '300',
            ),
          ),
          Divider(),
          SettingItem(
            iconData: Icons.notifications,
            iconColor: Colors.blue,
            title: "钱包",
            suffix: Suffix(
              text: '2',
            ),
          ),
        ],
      ),
    );
  }
}

/// 每行布局
class SettingItem extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String title;
  final Widget suffix;

  const SettingItem(
      {Key? key,
      required this.iconData,
      required this.iconColor,
      required this.title,
      required this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        children: [
          const SizedBox(width: 30),
          Icon(iconData, color: iconColor),
          const SizedBox(width: 30),
          Expanded(child: Text(title)),
          suffix,
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}

/// 每行最后的样式
class NotificationText extends StatelessWidget {
  final String text;

  const NotificationText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Colors.red,
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

/// 每行最后的样式
class Suffix extends StatelessWidget {
  final String text;

  const Suffix({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.grey.withOpacity(0.5)),
    );
  }
}
