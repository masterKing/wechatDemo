import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/chat/chat_page.dart';
import 'package:wechat_demo/pages/discover/discover_page.dart';
import 'package:wechat_demo/pages/friends/friends_page.dart';
import 'package:wechat_demo/pages/mine_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final _pageController = PageController(initialPage: 0);

  int _currentIndex = 0;

  void _onTap(int index){
    _currentIndex = index;
    setState(() {
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {

    List <Widget> pages = [
      ChatPage(),
      FriendsPage(),
      DiscoverPage(),
      MinePage(),
    ];

    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.green,
        currentIndex: _currentIndex,
        onTap: _onTap,
        selectedFontSize: 12.0,
        items: [
          BottomNavigationBarItem(
            icon: Image(width: 20,height: 20,image: AssetImage('images/tabbar_chat.png'),),
            activeIcon: Image(width: 20,height: 20,image: AssetImage('images/tabbar_chat_hl.png'),),
            label: "微信",
          ),
          BottomNavigationBarItem(
            icon: Image(width: 20,height: 20,image: AssetImage('images/tabbar_friends.png'),),
            activeIcon: Image(width: 20,height: 20,image: AssetImage('images/tabbar_friends_hl.png'),),
            label: "通讯录",
          ),
          BottomNavigationBarItem(
            icon: Image(width: 20,height: 20,image: AssetImage('images/tabbar_discover.png'),),
            activeIcon: Image(width: 20,height: 20,image: AssetImage('images/tabbar_discover_hl.png'),),
            label: "发现",
          ),
          BottomNavigationBarItem(
            icon: Image(width: 20,height: 20,image: AssetImage('images/tabbar_mine.png'),),
            activeIcon: Image(width: 20,height: 20,image: AssetImage('images/tabbar_mine_hl.png'),),
            label: "我",
          ),
        ],
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: pages,
      ),
    );
  }
}
