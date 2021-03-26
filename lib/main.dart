import 'package:first_project/pages/index/Index.dart';
import 'package:first_project/pages/edit/edit.dart';
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
      initialRoute: '/app', //默认访问的就/这里进行了修改
      onGenerateRoute: onGenerateRoute,
    );
  }
}

var routes = {
  //整个应用的路由配置
  '/app': (BuildContext context) => IndexPage(),
  '/edit': (BuildContext context, {arguments}) => EditPage(
        str: arguments,
      ),
};

//统一处理传参
var onGenerateRoute = (RouteSettings setting) {
  print('$setting-----');

  final String name = setting.name;
  final Function pageContentBuilder = routes[name];

  if (pageContentBuilder != null) {
    if (setting.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: setting.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
