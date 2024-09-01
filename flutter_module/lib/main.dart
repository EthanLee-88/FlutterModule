import 'package:flutter/material.dart';

import 'pages/MainActivity.dart';

void main() => runApp(const FlutterApp());

class FlutterApp extends StatelessWidget {
  //StatelessWidget 无状态（主题）的Widget ，类似于Android的 phoneWindow
  final String _appTitle = '微信';

  const FlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return getMaterialApp();
  }

  MaterialApp getMaterialApp() {
    // SharedPreferences.setMockInitialValues({}); //解决 SharedPreferences报错
    var materialApp = MaterialApp(
        //Material Design风格
        title: _appTitle, // 多任务栏显示的名字
        theme: getThemeData(),
        home: const MainActivity(
            title: '微信') //应用界面显示的widget，类似于Android的 DecorView
        );
    return materialApp;
  }

  ThemeData getThemeData() {
    var theme = ThemeData(
      primarySwatch: Colors.orange,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
    return theme;
  }
}
