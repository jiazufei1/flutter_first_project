import 'package:first_project/pages/news/child/myItem.dart';
import 'package:first_project/pages/news/child/mySwiper.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class NewPage extends StatefulWidget {
  NewPage({Key key}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  List banners = [];
  List feeds = [];
  String key = "0";
  ScrollController scrollcontroller = ScrollController();

  Future<void> refresh() async {
    key = "0";
    return await getHttp();
  }

  @override
  void initState() {
    scrollcontroller.addListener(() {
      //拉到最底部
      if (scrollcontroller.position.pixels ==
          scrollcontroller.position.maxScrollExtent) {
        //加载更多
        print("加载更多");
        getHttp();
      }
    });
    //发送网络请求
    getHttp();
    super.initState();
  }

  void getHttp() async {
    Response res =
        await Dio().get('http://app3.qdaily.com/app3/homes/index_v2/$key.json');
    print(res);

    setState(() {
      if (key == "0") {
        banners = res.data['response']['banners'];
        print('========${banners.length}');

        feeds = res.data['response']['feeds'];
        print('========${feeds.length}');
      } else {
        //第二页追加数据
        feeds.addAll(res.data['response']['feeds']);
      }
    });
    key = res.data['response']['last_key'];
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        color: Color(0xffffc81f),
        child: ListView.separated(
          controller: scrollcontroller,
          itemBuilder: (BuildContext context, int index) {
            //索引值是0的时候，现实轮播图
            if (index == 0) {
              return MySwiper(banners);
            }
            return MyItemWidget(feeds[index - 1]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 5.0,
              color: Color(0xffeeeeee),
            );
          },
          itemCount: feeds.length + 1,
        ),
        onRefresh: refresh);
  }
}
