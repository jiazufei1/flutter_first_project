import 'package:flutter/material.dart';
import 'package:first_project/pages/discovert/discover.dart';
import 'package:first_project/pages/home/home.dart';
import 'package:first_project/pages/me/me.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  var currentIndex = 0;

  List pageLists = [HomePage(), DiscoverPage(), MePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageLists[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: '探索'),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: '我的'),
        ],
        selectedItemColor: Color(0xffffc81f),
        unselectedItemColor: Color(0xff333333),
        onTap: (int index) {
          //触摸事件
          setState(() {
            currentIndex = index;
          });
          print(index);
        },
        currentIndex: currentIndex,
      ),
    );
  }
}
