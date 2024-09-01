import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../../bean/listData.dart';

class FourFragment extends StatelessWidget {
  const FourFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return _getMaterialApp();
  }

  MaterialApp _getMaterialApp() {
    return MaterialApp(
      home: getContent(),
    );
  }

  void setViewClickListener(int clickId) {
    switch (clickId) {
      case 0:
        break;
      case 1:
        break;
    }
  }

  Widget getContent() {
    return Column(
      children: <Widget>[
        AspectRatio(
          //宽高比盒子
          aspectRatio: 2 / 1,
          child: SizedBox(
            //尺寸盒子
            width: double.infinity,
            child: getBanner(),
          ),
        )
      ],
    );
  }

  Swiper getBanner() {
    return Swiper(
      scrollDirection: Axis.horizontal,
      // 横向
      itemCount: listData.length,
      // 数量
      autoplay: true,
      // 自动翻页
      itemBuilder: (BuildContext context, int index) {
        return Image.network(listData[index]['imageUrl'], fit: BoxFit.fill);
      },
      // 构建
      onTap: (index) {
        print('点击了第$index');
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
}
