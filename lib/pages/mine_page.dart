import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/discover/discover_cell.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  Widget _headerCell() {
    return Container(
      height: 200,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(top: 100),
        padding: EdgeInsets.all(10),
        child: Container(
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage('images/franky.jpg')),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text('Franky',style: TextStyle(fontSize: 28),),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('微信号:123456',style: TextStyle(fontSize: 20,color: Colors.grey),),
                            Image(image: AssetImage('images/icon_right.png'),width: 15,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
        children: [
          Container(
            color: Color.fromRGBO(220, 220, 220, 1.0),
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  children: [
                    _headerCell(),
                    SizedBox(
                      height: 10,
                    ),
                    DiscoverCell(title: '支付', imageName: 'images/微信 支付.png'),
                    SizedBox(
                      height: 10,
                    ),
                    DiscoverCell(title: '收藏', imageName: 'images/微信收藏.png'),
                    Row(
                      children: [
                        Container(
                          color: Colors.white,
                          width: 50,
                          height: 0.5,
                        )
                      ],
                    ),
                    DiscoverCell(title: '相册', imageName: 'images/微信相册.png'),
                    Row(
                      children: [
                        Container(
                          color: Colors.white,
                          width: 50,
                          height: 0.5,
                        )
                      ],
                    ),
                    DiscoverCell(title: '卡包', imageName: 'images/微信卡包.png'),
                    Row(
                      children: [
                        Container(
                          color: Colors.white,
                          width: 50,
                          height: 0.5,
                        )
                      ],
                    ),
                    DiscoverCell(title: '表情', imageName: 'images/微信表情.png'),
                    SizedBox(
                      height: 10,
                    ),
                    DiscoverCell(title: '设置', imageName: 'images/微信设置.png'),
                  ],
                )),
          ),
          Container(
              margin: EdgeInsets.only(top: 40),
              height: 25,
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: Image(
                        image: AssetImage('images/相机.png'),
                      ),
                      onTap: () {
                        print('点击了拍照');
                      },
                    )
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}
