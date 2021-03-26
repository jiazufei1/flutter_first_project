import 'package:flutter/material.dart';

// import 'MyListTile.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('刷新列表'),
        ),
        body: MyContentWidget(),
      ),
    );
  }
}

class MyContentWidget extends StatefulWidget {
  MyContentWidget({Key key}) : super(key: key);

  @override
  _MyContentWidgetState createState() => _MyContentWidgetState();
}

class _MyContentWidgetState extends State<MyContentWidget> {
  ScrollController _controller = ScrollController();
  List lists = [];

  //列表到底回调函数
  Future<void> _refresh() async {
    //setTimeout()
    return await Future.delayed(Duration(seconds: 3), () {
      //重新请求前10跳数据
      setState(() {
        lists = List.generate(10, (int index) {
          return '刷新后的数据 ---- ${index + 1}';
        });
      });
    });
  }

  @override
  void initState() {
    lists.addAll(List.generate(10, (int index) {
      return 'caaaa ---- ${index + 1}';
    }));

    _controller.addListener(() {
      // print(
      //     '${_controller.position.pixels}------${_controller.position.maxScrollExtent}');

      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        //加载下一屏的数据
        print('加载下一屏的数据');
        setState(() {
          lists.addAll(List.generate(10, (int index) {
            return 'caaaa ---- ${lists.length + index + 1}';
          }));
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: ListView.separated(
            controller: _controller,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 100.0,
                child: Text('${lists[index]}'),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 1.0,
                color: Colors.red,
              );
            },
            itemCount: lists.length),
        onRefresh: _refresh);
  }
}
