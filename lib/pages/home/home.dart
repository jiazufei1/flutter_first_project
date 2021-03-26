import 'package:first_project/pages/edit/edit.dart';
import 'package:first_project/pages/lab/lab.dart';
import 'package:first_project/pages/news/news.dart';
import 'package:flutter/material.dart';
import 'package:first_project/pages/search/search.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

//多继承
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Color(0xff333333),
          icon: Icon(Icons.search),
          onPressed: () {
            print('触摸搜索按钮');
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => SearchPage(
                  title: 'home页面传递的值',
                ),
              ),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            color: Color(0xff333333),
            icon: Icon(Icons.edit),
            onPressed: () {
              print('触摸编辑按钮');
              // Navigator.pushNamed(context, '/edit');
              Navigator.pushNamed(context, '/edit', arguments: '123edit');
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => EditPage(
              //       str: 'home页面传递的值',
              //     ),
              //   ),
              // );
            },
          )
        ],
        title: TabBar(
            controller: tabController,
            labelColor: Color(0xff333333),
            labelStyle: TextStyle(fontSize: 18.0),
            unselectedLabelColor: Color(0xff999999),
            unselectedLabelStyle: TextStyle(fontSize: 16.0),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Color(0xffffc81f),
            tabs: <Widget>[
              Tab(
                text: '新闻',
              ),
              Tab(
                text: '实验室',
              )
            ]),
      ),
      body: TabBarView(controller: tabController, children: <Widget>[
        NewPage(),
        LabPage(),
      ]),
    );
  }
}
