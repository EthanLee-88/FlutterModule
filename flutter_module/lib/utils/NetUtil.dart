import 'dart:convert';

import 'package:dio/dio.dart';

import '../bean/HomePage.dart';

class InterNetUtil {
  static final Dio _mDio = Dio();
  static const TAG = "NetUtil";

  static var instance = InterNetUtil();

  Future<HomePage> getHomePageData() async {
    dynamic result = await _mDio
        .get("https://www.xiaodangjingpai.com/api/dh/auction/bid/app/home");
    Map<String, dynamic> userMap = jsonDecode("$result");
    HomePage dataBean = HomePage.fromJson(userMap);
    return dataBean;
  }
}
