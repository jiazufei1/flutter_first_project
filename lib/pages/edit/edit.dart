import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  String str;
  EditPage({Key key, this.str = '默认值'}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState(this.str);
}

class _EditPageState extends State<EditPage> {
  String str;
  _EditPageState(this.str);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('编辑页面标题'),
      ),
      body: Text('编辑页面内容---$str'),
    );
  }
}
