import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        'https://t7.baidu.com/it/u=234609606,357589317&fm=193&f=GIF',
        width: 60.0,
        height: 60.0,
      ),
      title: Text('asdfadsf'),
      subtitle: Text(
        'subtitle',
        maxLines: 3,
        overflow: TextOverflow.clip,
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
