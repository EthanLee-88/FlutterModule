import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 状态栏
class StatusBarUtil {
  /// 修改状态栏背景及字体颜色
  static void setBarTextColor(Color barColor, Brightness textStyle) {
    SystemUiOverlayStyle style;
    if (textStyle == Brightness.light) {
      style = SystemUiOverlayStyle(
          systemNavigationBarColor: const Color(0xFF000000),
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
          statusBarColor: barColor);
    } else {
      style = SystemUiOverlayStyle(
          systemNavigationBarColor: const Color(0xFF000000),
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: barColor);
    }
    SystemChrome.setSystemUIOverlayStyle(style);
  }

  static const SystemUiOverlayStyle barLight = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent);

  static const SystemUiOverlayStyle bardDark = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.white);
}
