import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/discover/discover_cell.dart';
import 'package:wechat_demo/pages/const.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> with AutomaticKeepAliveClientMixin<DiscoverPage> {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        centerTitle: true,
        title: Text("发现", style: TextStyle(color: Colors.black87),),
        elevation: 0.0,
      ),
      body: Container(
        color: themeColor,
        height: 800,
        child: ListView(
          children: [
            DiscoverCell(title: '朋友圈', imageName: 'images/朋友圈.png',),
            SizedBox(height: 10,),
            DiscoverCell(title: '扫一扫', imageName: 'images/扫一扫2.png'),
            Row(children: [Container(color: Colors.white,height: 0.5,width: 50,),Container(color: themeColor,height: 0.5,)],),
            DiscoverCell(title: '摇一摇', imageName: 'images/摇一摇.png'),
            SizedBox(height: 10,),
            DiscoverCell(title: '看一看', imageName: 'images/看一看icon.png'),
            Row(children: [Container(color: Colors.white,height: 0.5,width: 50,),Container(color: themeColor,height: 0.5,)],),
            DiscoverCell(title: '搜一搜', imageName: 'images/搜一搜 2.png'),
            SizedBox(height: 10,),
            DiscoverCell(title: '附近的人', imageName: 'images/附近的人icon.png'),
            SizedBox(height: 10,),
            DiscoverCell(title: '购物', imageName: 'images/购物.png', subTitle: '618限时特价', subImageName: 'images/badge.png',),
            Row(children: [Container(color: Colors.white,height: 0.5,width: 50,),Container(color: themeColor,height: 0.5,)],),
            DiscoverCell(title: '游戏', imageName: 'images/游戏.png'),
            SizedBox(height: 10,),
            DiscoverCell(title: '小程序', imageName: 'images/小程序.png'),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
