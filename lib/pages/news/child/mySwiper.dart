import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//外部传来的值只会初始化一次
// class MySwiper extends StatefulWidget {
//   List banner;

//   MySwiper(this.banner, {Key key}) : super(key: key);

//   @override
//   _MySwiperState createState() => _MySwiperState(this.banner);
// }

// class _MySwiperState extends State<MySwiper> {
//   List banner;
//   _MySwiperState(this.banner);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text('----${banner.length}'),
//     );
//   }
// }

//取决于外部传来的banner，外部更新，这里也会更新
class MySwiper extends StatelessWidget {
  List banners;

  DotSwiperPaginationBuilder builder = DotSwiperPaginationBuilder(
    activeColor: Color(0xffffc81f),
    space: 5.0,
    size: 7.0,
  );

  MySwiper(this.banners, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //边界容错
    if (banners.length == 0) {
      return Container();
    }

    return Container(
      height: 200.0,
      child: Swiper(
        // autoplayDelay: 500,
        autoplay: true,
        pagination: SwiperPagination(builder: builder),
        itemCount: banners.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 200.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(banners[index]['image']),
                    fit: BoxFit.cover)),
            child: Stack(
              children: <Widget>[
                //为了让文字在图片上更清晰，加一个萌层
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: Container(
                    color: Color.fromARGB(50, 0, 0, 0),
                  ),
                ),
                Positioned(
                    bottom: 30.0,
                    left: 20.0,
                    right: 20.0,
                    child: Text(
                      banners[index]['post']['title'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
