import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/const.dart';
import 'package:wechat_demo/pages/discover/discover_child_page.dart';
import 'friends_data.dart';
import 'index_bar.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {

  final ScrollController _scrollController = ScrollController();
  final Map _groupOffsetMap = {
    '🔍' : 0.0,
  };
  double _maxScrollExtent = double.maxFinite;

  @override
  // 一般是初始化数据
  void initState() {
    super.initState();
    datas.sort((Friends a, Friends b) {
      return a.indexLetter!.compareTo(b.indexLetter!);
    });

    var groupOffset = 54.0 * addressBooks.length;
    for (int i = 0; i < datas.length; i++) {
      // 第一个肯定有组标题
      if (i < 1) {
        _groupOffsetMap.addAll({datas[i].indexLetter! : groupOffset});
        groupOffset += 30.0 + 54.0;
      }else if (datas[i].indexLetter == datas[i - 1].indexLetter) {
        groupOffset += 54.0;
      }else{
        _groupOffsetMap.addAll({datas[i].indexLetter! : groupOffset});
        groupOffset += 30.0 + 54.0;
      }
    }
    print(_groupOffsetMap);
  }

  Widget _cellForRow(BuildContext content, int index) {
    if (index < addressBooks.length) {
      final one = addressBooks[index];
      return _FriendLocalCell(imageName: one.imageName, title: one.title);
    }

    final two = datas[index - addressBooks.length];
    if (index - addressBooks.length == 0) {
      return _FriendNetworkCell(
        imageUrl: two.imageUrl,
        name: two.name,
        groupTitle: two.indexLetter,
      );
    } else {
      final three = datas[index - addressBooks.length - 1];
      if (two.indexLetter == three.indexLetter) {
        return _FriendNetworkCell(
          imageUrl: two.imageUrl,
          name: two.name,
        );
      } else {
        return _FriendNetworkCell(
          imageUrl: two.imageUrl,
          name: two.name,
          groupTitle: two.indexLetter,
        );
      }
    }
  }

  @override
  // 一般用来初始化视图
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        centerTitle: true,
        elevation: 0.0,
        titleSpacing: 0.0,
        actions: [
          GestureDetector(
            onTap: () {
              print('添加好友');
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      DiscoverChildPage(title: '添加好友')));
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Image(
                image: AssetImage('images/icon_friends_add.png'),
                width: 30,
              ),
            ),
          ),
        ],
        title: Text(
          "通讯录",
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Container(
        color: themeColor,
        child: Stack(
          children: [
            Container(
              child: NotificationListener(
                onNotification: (ScrollNotification note){
                  // print(note.metrics.pixels.toInt());
                  // print(note.metrics.maxScrollExtent.toDouble());
                  _maxScrollExtent = note.metrics.maxScrollExtent.toDouble();
                  return true;
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: addressBooks.length + datas.length,
                  itemBuilder: _cellForRow,
                ),
              ),
            ),
            IndexBar(indexBarCallBack: (String str){
              print(str);
              if (_groupOffsetMap[str] != null) {
                final duration = Duration(milliseconds: 10);
                final curve = Curves.easeIn;
                if (_groupOffsetMap[str] < _maxScrollExtent) {
                  _scrollController.animateTo(
                      _groupOffsetMap[str],
                      duration: duration,
                      curve: curve
                  );
                }else{
                  _scrollController.animateTo(
                      _maxScrollExtent,
                      duration: duration,
                      curve: curve
                  );
                }
              }
            }),
          ],
        ),
      ),
    );
  }
}

class _FriendLocalCell extends StatelessWidget {
  final String imageName;
  final String title;

  const _FriendLocalCell({
    Key? key,
    required this.imageName,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              image: DecorationImage(image: AssetImage(imageName)),
            ),
          ),
          Container(
              child: Column(
            children: [
              Container(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
                height: 53.5,
                width: screenWidth(context) - 54,
                alignment: Alignment.centerLeft,
              ),
              Container(
                color: themeColor,
                width: screenWidth(context) - 54,
                height: .5,
              ),
            ],
          )),
        ],
      ),
    );
  }
}

class _FriendNetworkCell extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String? groupTitle;

  const _FriendNetworkCell({
    Key? key,
    required this.imageUrl,
    required this.name,
    this.groupTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: groupTitle == null ? 0 : 30,
            child: groupTitle == null
                ? null
                : Text(
                    groupTitle!,
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
            alignment: Alignment.centerLeft,
            color: themeColor,
            padding: EdgeInsets.only(left: 10),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    image: DecorationImage(image: NetworkImage(imageUrl)),
                  ),
                ),
                Container(
                    child: Column(
                  children: [
                    Container(
                      child: Text(
                        name,
                        style: TextStyle(fontSize: 18),
                      ),
                      height: 53.5,
                      width: screenWidth(context) - 54,
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      color: themeColor,
                      width: screenWidth(context) - 54,
                      height: .5,
                    ),
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
