import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wechat_demo/pages/discover/discover_child_page.dart';

class DiscoverCell extends StatefulWidget {
  final String title;
  final String imageName;
  final String? subTitle;
  final String? subImageName;

  const DiscoverCell({
    Key? key,
    required this.title,
    required this.imageName,
    this.subTitle,
    this.subImageName,
  }) : super(key: key);

  @override
  _DiscoverCellState createState() => _DiscoverCellState();
}

class _DiscoverCellState extends State<DiscoverCell> {
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('onTap');
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => DiscoverChildPage(title: widget.title))
        );
        setState(() {
          _backgroundColor = Colors.white;
        });
      },
      onTapDown: (TapDownDetails details){
        print('onTapDown');
        setState(() {
          _backgroundColor = Colors.grey;
        });
      },
      onTapCancel: (){
        print('onTapCancel');
        setState(() {
          _backgroundColor = Colors.white;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        color: _backgroundColor,
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Image(
                    image: AssetImage(widget.imageName),
                    width: 20,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(widget.title),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Text(widget.subTitle == null ? '' : '${widget.subTitle}',style: TextStyle(color: Colors.grey, fontSize: 13),),
                  widget.subImageName == null
                      ? Container()
                      : Image(
                    image: AssetImage(widget.subImageName!),
                    width: 15,
                  ),
                  Image(
                    image: AssetImage('images/icon_right.png'),
                    width: 15,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
