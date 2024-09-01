import 'package:flutter/material.dart';

import 'center/SecondFragment.dart';
import 'home/HomeFragment.dart';
import 'mine/FourFragment.dart';
import 'news/ThirdFragment.dart';

class MainActivity extends StatefulWidget {
  // StatefulWidget 有状态的widget
  const MainActivity({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MainActivity> {
  int currentPage = 0;
  final finalTab = <String>['微信', '通讯录', '发现', '我'];
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return getMainLayout(); // setContentView
  }

  Scaffold getMainLayout() {
    // getDecorView
    var scaffold = Scaffold(
        body: getPageView(), // ContentView ViewPager
        bottomNavigationBar: getNavigationBar(), //底部导航栏
        backgroundColor: Colors.grey);
    return scaffold;
  }

  /// ViewPager
  PageView getPageView() {
    // PageView
    var pages = [
      const HomeFragment(),
      const SecondFragment(),
      const ThirdFragment(),
      const FourFragment()
    ];
    var pageView = PageView(
        controller: pageController,
        onPageChanged: _onPageChange,
        children: pages);
    return pageView;
  }

  /// 底部导航栏
  BottomNavigationBar getNavigationBar() {
    var navigationItems = [
      BottomNavigationBarItem(
          icon: const Icon(Icons.alternate_email_rounded), label: finalTab[0]),
      BottomNavigationBarItem(
          icon: const Icon(Icons.add_photo_alternate_outlined),
          label: finalTab[1]),
      BottomNavigationBarItem(
          icon: const Icon(Icons.album_rounded), label: finalTab[2]),
      BottomNavigationBarItem(
          icon: const Icon(Icons.account_circle_sharp), label: finalTab[3])
    ];
    var myBottomNavigationBar = BottomNavigationBar(
      items: navigationItems,
      currentIndex: currentPage,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: _onItemSelect,
      type: BottomNavigationBarType.fixed,
    );
    return myBottomNavigationBar;
  }

  void _onPageChange(int index) {
    // PageView发生改变，更改NavigationBar
    setState(() {
      // 更新状态
      currentPage = index;
    });
    print(index);
  }

  void _onItemSelect(int index) {
    // NavigationBar发生改变，更改PageView
    setState(() {
      // 更新状态
      currentPage = index;
      pageController.jumpToPage(index);
    });
    print(index);
  }
}
