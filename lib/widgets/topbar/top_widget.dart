import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';
import 'package:gzldtechnology/utils/sps.dart';
import 'package:gzldtechnology/utils/toast.dart';
import 'package:gzldtechnology/widgets/service/home_menu_widget.dart';
import 'package:gzldtechnology/widgets/service/home_row_title.dart';
import 'package:gzldtechnology/widgets/service/home_row_widget.dart';
import 'package:gzldtechnology/widgets/service/service_video_widget.dart';
import 'package:gzldtechnology/widgets/topbar/top_banner_widget.dart';
//create by :xs
//day by2020/6/3.
//describe:头部复用
class TopWidget extends StatefulWidget {

  final int tag;
  final String title;
  const TopWidget({Key key, this.tag,this.title}) : super(key: key);
  @override
  _TopWidgetState createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  List<String>  banner=[
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591160592618&di=628dbee5cb9e65bb00810c240ad42e89&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fupload%2F20170309%2F61859dee36f346e9acdf595752440769_th.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591166327878&di=dc8c43d9ba8e258489e978b55d6135e4&imgtype=0&src=http%3A%2F%2Fa3.att.hudong.com%2F80%2F49%2F20300000861164130821490547828.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Stack(
        children: <Widget>[
          buildTopBak(),
          Column(
            children: <Widget>[
              buildTitle(),
              widget.tag!=3?buildTopBanner():Container(),
            ],
          )
         // buildTopTitle (),
        ],
    );
  }
  Widget  buildTitle(){
    return  Container(
        height: ScreenAdapter.height(140),
        width: double.infinity,
          child:  AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
              title: Text(widget.title,textAlign:TextAlign.center,style: TextStyle(fontSize: ScreenAdapter.setSize(38),color: Colors.white),))
        );

  }
  Widget buildTopBak(){
    return Container(
        height:  widget.tag==0? ScreenAdapter.height(435):ScreenAdapter.height(290),

      child: Image.asset( widget.tag==0?"assets/images/icon_top_back.png":"assets/images/service_back.png",
        fit:  BoxFit.fill,
        width: MediaQuery.of(context).size.width,
        height: widget.tag==0? ScreenAdapter.height(435):ScreenAdapter.height(290),
        )
      );

  }
  Widget buildTopTitle(){
    return Container(
      child:  ListView(
          children: <Widget>[

            HomeMenuWidget(),
            Sps.buildHGaps(20.0),
            HomeRowWidget(
              title: "企业智能服务中心展示",
              flag: 1.0,
              onPressed: () {
                Toast.show("点击");
                //NavigatorUtil.goVideoClassfyPage(context,StringRes.home_title2,"1");
              },
              child: ServiceVideoWidget( ),
            ),
            HomeRowTitle(
              title: "企业智能服务中心筹备处",
              onPressed: (){
                Toast.show("点击");
              },
            )
          ],
      )
    );
  }
  Widget buildTopBanner(){
    return   Container(
      margin: EdgeInsets.only(top: ScreenAdapter.height(20)),
        child:TopBannerWidget(
        listData: banner,
    ));

  }
}
