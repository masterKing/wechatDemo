import 'package:flutter/material.dart';
import '../const.dart';

class IndexBar extends StatefulWidget {
  final void Function(String str) indexBarCallBack;

  const IndexBar({Key? key, required this.indexBarCallBack}) : super(key: key);

  @override
  _IndexBarState createState() => _IndexBarState();
}

class _IndexBarState extends State<IndexBar> {
  var _currentIndexLetter = '';
  final _index_words = [];
  Color _backgroundColor = Color.fromRGBO(1, 1, 1, 0.0);
  Color _textColor = Colors.black;

  var _showIndicator = false;
  var _indicatorAlignmentY = -1.13;

  String? getIndexLetter(BuildContext context,Offset globalPosition) {
    RenderBox? box = context.findRenderObject() as RenderBox?;
    if (box != null) {
      double y = box.globalToLocal(globalPosition).dy;
      final itemHeight = screenHeight(context)/2/_index_words.length;
      int index = (y ~/ itemHeight).clamp(0, _index_words.length - 1);
      return _index_words[index];
    }
    return null;
  }

  @override
  void initState() {
    super.initState();

    _index_words.add('🔍');
    for (int i = 0; i < 26; i++) {
      var string = String.fromCharCode(i + 65);
      _index_words.add(string);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> indexWidgets = [];
    for (int i = 0; i < _index_words.length; i++) {
      indexWidgets.add(Expanded(
          child: Container(
            child: Text(_index_words[i],
                style: TextStyle(
                  fontSize: 10,
                  color: _textColor,
                )
            ),
          ),
        )
      );
    }

    return Positioned(
      top: screenHeight(context) / 8,
      right: 0,
      width: 100,
      height: screenHeight(context) / 2,
      child: Row(
        children: [
          Container(
            alignment: Alignment(0,_indicatorAlignmentY),
            width: 70,
            child: !_showIndicator? null : Stack(
              alignment: Alignment(-0.3,0),
              children: [
                Image(image: AssetImage('images/气泡.png'), width: 60,),
                Text(_currentIndexLetter, style: TextStyle(color: Colors.white, fontSize: 35),)
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              width: 30,
              color: _backgroundColor,
              child: Column(
                children: indexWidgets,
              ),
            ),
            onVerticalDragDown: (DragDownDetails details){
              if (_currentIndexLetter != getIndexLetter(context, details.globalPosition)!) {
                _currentIndexLetter = getIndexLetter(context, details.globalPosition)!;
                widget.indexBarCallBack(_currentIndexLetter);
              }
              _backgroundColor = Color.fromRGBO(1, 1, 1, 0.5);
              _textColor = Colors.white;
              _showIndicator = true;
              setState(() {});
            },
            onVerticalDragUpdate: (DragUpdateDetails details){
              if (_currentIndexLetter != getIndexLetter(context, details.globalPosition)!) {
                _currentIndexLetter = getIndexLetter(context, details.globalPosition)!;
                widget.indexBarCallBack(_currentIndexLetter);
                _indicatorAlignmentY = (1.13 + 1.13) / (_index_words.length.toDouble() - 1) * _index_words.indexOf(_currentIndexLetter) - 1.13;
                setState(() {});
              }
            },
            onVerticalDragEnd: (DragEndDetails details){
              _backgroundColor = Color.fromRGBO(1, 1, 1, 0.0);
              _textColor = Colors.black;
              _showIndicator = false;
              setState(() {});
            },
          ),
        ],
      )
    );
  }
}

