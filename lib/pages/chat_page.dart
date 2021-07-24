import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/const.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text("微信", style: TextStyle(color: Colors.black87),),
        centerTitle: true,
      ),
      body: Center(
        child: Text("微信界面"),
      ),
    );
  }
}
