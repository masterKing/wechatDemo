import 'dart:math';

import 'package:flutter/material.dart';

// 主题色
final Color themeColor = Color.fromRGBO(220, 220, 220, 1.0);

// 屏幕宽
double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

// 屏幕宽
double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

// 随机色
Color randomColors(){
  var rng = new Random();
  return Color.fromRGBO(rng.nextInt(255), rng.nextInt(255), rng.nextInt(255), 1.0);
}