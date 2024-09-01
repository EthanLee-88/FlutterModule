import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../../bean/BannerBean.dart';
import '../../bean/HomePage.dart';
import '../../utils/NetUtil.dart';

class HeroList {
  int? code;
  String? msg;
  List<HeroBean> dataList = <HeroBean>[];

  HeroList({this.code, this.msg, required this.dataList});

  factory HeroList.fromJson(Map<String, dynamic> jsonMap) {
    List<dynamic> itemList = <dynamic>[];
    try {
      //dart异常
      print(
          'one ${jsonMap.containsKey('data')} + two = ${jsonMap.containsKey('data1')}');
      if (jsonMap.containsKey('data')) {
        //dart判断key值
        itemList = jsonMap['data'];

        String dataStr = jsonMap['data'];
        print('dataStr = $dataStr');
      }
    } catch (e) {
      print('dataStr = ${e.toString()}');
    }
    List<HeroBean> dataList = <HeroBean>[];
    for (Map<String, dynamic> element in itemList) {
      print(
          "element = $element + ${itemList.length} + ${jsonMap['code']} + ${jsonMap['msg']}");
      HeroBean heroBean = HeroBean.fromJson(element);
      dataList.add(heroBean);
    }
    return HeroList(
        code: jsonMap['code'], msg: jsonMap['msg'], dataList: dataList);
  }
}

class HeroBean {
  String? heroName;
  String? hero;
  String photo;

  HeroBean({this.heroName, this.hero, required this.photo});

  factory HeroBean.fromJson(Map<String, dynamic> map) {
    return HeroBean(
        heroName: map['heroName'], hero: map['hero'], photo: map['photo']);
  }
}

class HomeViewModel {
  static const String jsonTest = """{
	"code": 722500,
	"msg": "系统异常，操作",
	"traceId": "202304151229424811647094825004077057",
	"appId": null,
	"data": null
}""";
  static const String _bannerJsonStr = """{
	"code": 200,
	"msg": "success",
	"data": [{
		"heroName": "Tony",
		"hero": "钢铁侠",
		"photo": "https://www.itying.com/images/flutter/1.png"
	},{
		"heroName": "Tony",
		"hero": "钢铁侠",
		"photo": "https://www.itying.com/images/flutter/2.png"
	},{
		"heroName": "Tony",
		"hero": "钢铁侠",
		"photo": "https://www.itying.com/images/flutter/3.png"
	},{
		"heroName": "Tony",
		"hero": "钢铁侠",
		"photo": "https://www.itying.com/images/flutter/4.png"
	},{
		"heroName": "Tony",
		"hero": "钢铁侠",
		"photo": "https://www.itying.com/images/flutter/5.png"
	}]
}""";

  static HeroList getBannerListByJson() {
    return HeroList.fromJson(jsonDecode(_bannerJsonStr));
  }

  static List<BannerBean> getHeroList() {
    var list = <BannerBean>[];
    for (int i = 0; i < 6; i++) {
      var bean = BannerBean(photo: '');
      list.add(bean);
      switch (i) {
        case 0:
          bean.heroName = "Tony";
          bean.hero = "钢铁侠";
          bean.photo = "https://www.itying.com/images/flutter/1.png";
          break;
        case 1:
          bean.heroName = "thor";
          bean.hero = "雷神";
          bean.photo = "https://www.itying.com/images/flutter/2.png";
          break;
        case 2:
          bean.heroName = "captain";
          bean.hero = "美队";
          bean.photo = "https://www.itying.com/images/flutter/3.png";
          break;
        case 3:
          bean.heroName = "spiderMan";
          bean.hero = "蜘蛛侠";
          bean.photo = "https://www.itying.com/images/flutter/4.png";
          break;
        case 4:
          bean.heroName = "doctor";
          bean.hero = "奇异博士";
          bean.photo = "https://www.itying.com/images/flutter/5.png";
          break;
        case 5:
          bean.heroName = "Scarlet Witch";
          bean.hero = "旺达";
          bean.photo = "https://www.itying.com/images/flutter/6.png";
          break;
      }
    }
    return list;
  }
}
