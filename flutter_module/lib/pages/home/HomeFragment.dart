import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import '../../bean/HomePage.dart';
import '../../bean/listData.dart';
import '../../utils/ColorsUtil.dart';
import '../../utils/NetUtil.dart';
import '../../utils/StatusBarUtil.dart';
import 'HomeViewModel.dart';

//flutter run edge --web-renderer html -release

class _HomePageState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: getMainLayout(),
      theme: getHomeTheme(),
    );
  }

  /// 主题
  ThemeData getHomeTheme() {
    var theme = ThemeData(
      primarySwatch: Colors.orange,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
    return theme;
  }

  ///主布局
  Widget getMainLayout() {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        primary: true,
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: <Widget>[
              getBannerContent(),
              getContentLayout(),
              getContentLayout1(),
              getSpaceContent(),
              getSpaceContent(),
              getSpaceContent(),
              getListView()
            ],
          ),
        ),
      ),
    );
  }

  Widget getListContainer() {
    return Expanded(
      child: getListView(),
    );
  }

  ListView getListView() {
    var listView = ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 0, top: 8, right: 0, bottom: 0),
      physics: const BouncingScrollPhysics(),
      children: getListChildren(),
    );
    return listView;
  }

  List<Widget> getListChildren() {
    var childrenList = listData.map((e) => Container(
        color: Colors.white,
        margin: const EdgeInsets.fromLTRB(1, 1, 1, 1),
        child: ListTile(
            leading: Image.network(e['imageUrl'], fit: BoxFit.fill),
            title: Text(e['title'],
                style: const TextStyle(color: Colors.black, fontSize: 22)),
            subtitle: Text(e['author']))));
    return childrenList.toList();
  }

  Widget getSpaceContent() {
    return Container(
      margin: const EdgeInsets.only(left: 2, top: 8, right: 0, bottom: 0),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
              flex: 36,
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: GestureDetector(
                    onTap: () {
                      print('click test');
                    },
                    child: Container(
                      color: Colors.orange,
                    ),
                  ),
                ),
              )),
          const Expanded(
              child: Spacer(
            flex: 1,
          )),
          Expanded(
              flex: 24,
              child: AspectRatio(
                  aspectRatio: 0.67,
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Expanded(
                          flex: 40,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              color: Colors.green,
                              child: Image.network(
                                  'https://www.itying.com/images/flutter/2.png',
                                  fit: BoxFit.cover),
                            ),
                          )),
                      const Expanded(
                          child: Spacer(
                        flex: 3,
                      )),
                      Expanded(
                          flex: 40,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              color: Colors.blue,
                              child: Image.network(
                                  'https://www.itying.com/images/flutter/3.png',
                                  fit: BoxFit.cover),
                            ),
                          ))
                    ],
                  ))),
        ],
      ),
    );
  }

  ///首页轮播图
  Widget getBannerContent() {
    return AspectRatio(
      //宽高比盒子
      aspectRatio: 2 / 1,
      child: SizedBox(
        //尺寸盒子
        width: double.infinity,
        child: getBannerView(),
      ),
    );
  }

  ///轮播图
  Swiper getBanner(List<HeroBean> dataList) {
    return Swiper(
      scrollDirection: Axis.horizontal,
      // 横向
      itemCount: dataList.length,
      // 数量
      autoplay: true,
      // 自动翻页
      itemBuilder: (BuildContext context, int index) {
        return Image.network(dataList.elementAt(index).photo, fit: BoxFit.fill);
      },
      // 构建
      onTap: (index) {
        // SharePreferenceUtil.setString(SharePreferenceUtil.keyTest, "iron man");
      },
      // 点击事件 onTap
      pagination: const SwiperPagination(
          // 分页指示器
          alignment: Alignment.bottomCenter,
          // 位置 Alignment.bottomCenter 底部中间
          margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
          // 距离调整
          builder: DotSwiperPaginationBuilder(
              // 指示器构建
              space: 5,
              // 点之间的间隔
              size: 10,
              // 没选中时的大小
              activeSize: 13,
              // 选中时的大小
              color: Colors.black54,
              // 没选中时的颜色
              activeColor: Colors.white)),
      // 选中时的颜色
      control: const SwiperControl(color: Colors.black),
      // 页面控制器 左右翻页按钮
      scale: 0.95, // 两张图片之间的间隔
    );
  }

  Widget getTitleLayout() {
    return Container(
      color: ColorsUtil.orangeFFE65100,
      width: double.infinity,
      height: 88,
      child: Column(
        children: <Widget>[
          const Spacer(), //设置距离顶部间距
          Container(
            child: const SizedBox(
              //设置尺寸
              height: 44,
              width: double.infinity,
              child: Center(
                  //实现控件居中
                  child: Text('首页',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ColorsUtil.white,
                          fontSize: 18, // 字体大小
                          fontWeight: FontWeight.bold, // 字体加粗
                          decoration: TextDecoration.none))),
            ),
          ),
        ],
      ),
    );
  }

  var _count = 0;
  final bannerList = <BannerList>[];

  Widget getContentLayout() {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          // setViewListener(0);
          // setBannerDataList(<BannerList>[
          //   BannerList(
          //       image:
          //           "https://yihuandl.oppo.com/bidding_images/schematic_diagram/20240817/"
          //           "110209_1824642847257792512_1723863729614.png")
          // ]);
          InterNetUtil.instance.getHomePageData().then((value) {
            final source = value.data?.bannerList;
            final list = (source == null) ? <BannerList>[] : source;
            print("bannerList = ${list.length}");
            list.add(BannerList(
                image: "https://www.itying.com/images/flutter/2.png"));
            setBannerDataList(list);
            // Future.delayed(Duration(seconds: 1)).then((value) {
            //   setBannerDataList(list);
            // });

            // setBannerDataList(<BannerList>[
            //   BannerList(
            //       image:
            //           "https://yihuandl.oppo.com/bidding_images/schematic_diagram/20240817/"
            //           "110209_1824642847257792512_1723863729614.png"),
            //   BannerList(
            //       image:
            //           "https://yihuandl.oppo.com/bidding_images/schematic_diagram/20240817/"
            //           "110209_1824642847257792512_1723863729614.png"),
            //   BannerList(
            //       image:
            //       "https://yihuandl.oppo.com/bidding_images/schematic_diagram/20240817/"
            //           "110209_1824642847257792512_1723863729614.png"),
            //   BannerList(
            //       image:
            //           "https://yihuandl.oppo.com/bidding_images/schematic_diagram/20240817/"
            //           "110209_1824642847257792512_1723863729614.png")
            // ]);
          });
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)))),
        child: Padding(
            //设置内部间距
            padding: EdgeInsets.only(left: 18, top: 2, right: 18, bottom: 2),
            child: Text(
              '测试按钮${_count}',
              style: TextStyle(
                  color: ColorsUtil.white,
                  fontSize: 13, // 字体大小
                  decoration: TextDecoration.none),
            )),
      ),
    );
  }

  setBannerDataList(List<BannerList> list) {
    setState(() {
      _count++;
      bannerList.clear();
      bannerList.addAll(list);
    });
  }

  Widget getContentLayout1() {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          // setViewListener(0);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)))),
        child: Padding(
            //设置内部间距
            padding: EdgeInsets.only(left: 18, top: 2, right: 18, bottom: 2),
            child: Text(
              '测试按钮alpha = ${_count}',
              style: TextStyle(
                  color: ColorsUtil.white,
                  fontSize: 13, // 字体大小
                  decoration: TextDecoration.none),
            )),
      ),
    );
  }

  void setViewListener(int clickId) {
    switch (clickId) {
      case 0:
        // SharePreferenceUtil.getString(SharePreferenceUtil.keyTest)
        //     .then((value) => {print("share getValue = $value")});
        // Permission.storage.status.then(
        //     (value) => {print("Permission status s = ${value.isGranted}")});
        // Permission.camera.status.then(
        //     (value) => {print("Permission status m = ${value.isGranted}")});
        // [Permission.storage, Permission.camera].request().then((value) => {
        //       value.entries.forEach((element) {
        //         print(
        //             "Permission status back = ${element.key} + ${element.value}");
        //       })
        //     });
        break;
    }
  }

  Widget getFlexWidget() {
    return Column(
      children: <Widget>[
        //Flex的两个子widget按1：2来占据水平空间
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                height: 30.0,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  SystemChrome.setSystemUIOverlayStyle(
                      SystemUiOverlayStyle.light);
                },
                child: Text("按钮"),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            height: 100.0,
            //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30.0,
                    color: ColorsUtil.orangeFFE65100,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      // StatusBarUtil.setBarTextColor(Colors.transparent);
                      StatusBarUtil.setBarTextColor(
                          Colors.transparent, Brightness.dark);
                    },
                    child: Text("测试按钮1"),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      // StatusBarUtil.setBarTextColor(Colors.white);
                      StatusBarUtil.setBarTextColor(
                          Colors.orange, Brightness.light);
                    },
                    child: Text("测试按钮"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Swiper getBannerView() {
    return Swiper(
      // 点击事件 onTap
      pagination: const SwiperPagination(
          // 分页指示器
          alignment: Alignment.bottomCenter,
          // 位置 Alignment.bottomCenter 底部中间
          margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
          // 距离调整
          builder: DotSwiperPaginationBuilder(
              // 指示器构建
              space: 5,
              // 点之间的间隔
              size: 10,
              // 没选中时的大小
              activeSize: 13,
              // 选中时的大小
              color: Colors.black54,
              // 没选中时的颜色
              activeColor: Colors.white)),
      // 选中时的颜色
      control: const SwiperControl(color: Colors.black),
      scrollDirection: Axis.horizontal,
      // 横向
      itemCount: bannerList.length,
      // 数量
      autoplay: true,
      // 自动翻页
      itemBuilder: (BuildContext context, int index) {
        final source = bannerList.elementAt(index).image;
        final url = (source == null) ? "" : source;
        print("getBannerItemView = $url - $index");
        return Image.network(url, fit: BoxFit.fill);
      },
      // 构建
      onTap: (index) {
        // SharePreferenceUtil.setString(SharePreferenceUtil.keyTest, "iron man");
      },
      // 页面控制器 左右翻页按钮
      scale: 0.95, // 两张图片之间的间隔
    );
  }
}

/// 首页
class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   StatusBarUtil.setBarTextColor(Colors.transparent, Brightness.light);
  //   return MaterialApp(
  //     home: getMainLayout(),
  //     theme: getHomeTheme(),
  //   );
  // }

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}
