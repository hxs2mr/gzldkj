import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gzldtechnology/utils/color.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';
import 'package:gzldtechnology/utils/sps.dart';
//create by :xs
//day by2020/6/3.
//describe:
class ServiceVideoWidget extends StatefulWidget {
  ServiceVideoWidget({this.model});
  final model;
  @override
  ServiceVideoState createState() => ServiceVideoState();
}

class ServiceVideoState extends State<ServiceVideoWidget> {
 // List<RecommendcVideoList> listData = [];
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return   Card(
            elevation: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Sps.hPure660,
                Container(
                  margin: EdgeInsets.fromLTRB(ScreenAdapter.width(15), ScreenAdapter.width(15), ScreenAdapter.width(15), 0),
                  child:  _buildStack("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591178816031&di=2ebce75b7d591c9316f32d4f583b74c6&imgtype=0&src=http%3A%2F%2Fimg.redocn.com%2F201504%2F14%2F3982157_1428972541RSzT.jpg",
                    "","",),
                ),
                Sps.buildHGaps(15.0),
              ],
            )
        )
     ;
  }

  //RecommendcVideoList item
  Widget _buildStack(String img,String videoUrl,String title) {
    return Stack(
      children: <Widget>[
        Container(
          height: ScreenAdapter.height(340.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(ScreenAdapter.width(5.0)),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: CachedNetworkImageProvider(
                img,
              ),
            ),
          ),
          child: InkWell(
            onTap: () {
            //  NavigatorUtil.jumpPlayVideo(context, videoUrl,title,otherMsg,markdown,"0","0");
            },
            child: Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/icon_play_video.png',
                width: ScreenAdapter.width(60),
                height: ScreenAdapter.height(60),
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 5,
            right: 10,
            child: Text(
              "",
              style: TextStyle(
                  color: ColorR.text_dark,
                  fontSize: ScreenAdapter.setSize(24.0)),
            ))
      ],
    );
  }
}
