import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  String title;
  SearchPage({Key key, this.title = '默认标题'}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState(this.title);
}

class _SearchPageState extends State<SearchPage> {
  String title;
  _SearchPageState(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Text('搜索页面'),
    );
  }
}
