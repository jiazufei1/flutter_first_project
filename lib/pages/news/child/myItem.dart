import 'package:flutter/material.dart';

class MyItemWidget extends StatelessWidget {
  Map feed;

  MyItemWidget(this.feed, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (feed["type"] == 2 || feed["type"] == 0) {
      return Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 195.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(feed["image"]),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Text(
                feed["post"]["title"],
                style: TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 10.0, bottom: 20.0),
              child: Text(
                feed["post"]["description"],
                style: TextStyle(
                  color: Color(0xff999999),
                  fontSize: 14.0,
                ),
              ),
            )
          ],
        ),
      );
    } else if (feed["type"] == 1) {
      return Container(
        height: 120.0,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      feed["post"]["title"],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        feed["post"]["category"]["title"],
                        style: TextStyle(
                          color: Color(0xff999999),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Image.network(
                feed["image"],
                fit: BoxFit.cover,
              ),
              flex: 1,
            ),
          ],
        ),
      );
    } else {
      return Text('${feed["post"]["title"]}');
    }
  }
}
