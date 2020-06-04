import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gzldtechnology/base/base_state.dart';
import 'package:gzldtechnology/pages/home/presenter/home_presenter.dart';
import 'package:gzldtechnology/utils/color.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';
import 'package:gzldtechnology/utils/sps.dart';
import 'package:gzldtechnology/utils/toast.dart';
import 'package:gzldtechnology/widgets/home/home_im_widget.dart';
import 'package:gzldtechnology/widgets/home/top_home_banner.dart';
import 'package:gzldtechnology/widgets/topbar/top_toolback.dart';
import 'package:gzldtechnology/widgets/topbar/top_toolbar.dart';

//create by :xs
//day by2020/6/2.
//describe:首页
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends BaseState<HomePage,HomePresenter>with AutomaticKeepAliveClientMixin {
  List<String>  banner=[
    "https://dcdn.it120.cc/2020/06/04/96c632f5-13e8-4ed2-9f4b-5afb713e30aa.png",
  ];
  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenAdapter.init(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(

          backgroundColor: ColorR.gray_f5,
          body: Container(

              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0,ScreenAdapter.height(320),0,10),
                    decoration: BoxDecoration(
                        image: DecorationImage(image: ExactAssetImage("assets/images/icon_home_bg.png"),fit: BoxFit.cover)
                    ),
                  ),
                  TopToolBack(tag: 1,),
                  TopToolBar(title: "小遇",),

                  Container(
                      padding: EdgeInsets.only(top: ScreenAdapter.height(165)),
                      child:ListView(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.all(0),
                        children: [
                          TopHomeBanner(listData: banner,),
                        ],
                      )
                  ),
                  Positioned(
                      width: MediaQuery.of(context).size.width,
                      bottom: ScreenAdapter.height(10),
                      child:Container(height: ScreenAdapter.height(165), color: Color(0xFFFAFBFC),
                        child: buildIm(),)
                  )

                ],
              )
          )

      ),

    );
  }
  /*
  * 底部的聊天widget
  * */
  Widget buildIm(){
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB( ScreenAdapter.height(20),ScreenAdapter.height(10),ScreenAdapter.height(20),0),
          height: ScreenAdapter.height(65),
          child: Row(
            children: <Widget>[
              buildItemSpeak("论道"),
              buildItemSpeak("养生"),
              buildItemSpeak("LOL"),
            ],
          ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(ScreenAdapter.width(25), 0, ScreenAdapter.width(25), 0),
            height: ScreenAdapter.height(85),
            child: Row(
              children: <Widget>[
                InkWell(
                  child: Image.asset("assets/images/icon_voice.png",width: ScreenAdapter.width(64),height: ScreenAdapter.height(64),fit: BoxFit.cover),
                  onTap: (){
                    Toast.show("发语音");
                  },
                ),
                Sps.buildWGaps(14.0),
                Expanded(child: HomeIMWidget()),
                Sps.buildWGaps(14.0),
                InkWell(
                  child: Image.asset("assets/images/icon_send.png",width: ScreenAdapter.width(64),height: ScreenAdapter.height(64),fit: BoxFit.cover,),
                  onTap: (){
                    Toast.show("发送");
                  },
                ),

              ],
            )
          ),

      ],
    );
  }

  Widget buildItemSpeak(title){
    return Container(
          margin: EdgeInsets.only(left: ScreenAdapter.width(10)),
          alignment: Alignment.center,
          width: ScreenAdapter.width(122),
          height: ScreenAdapter.height(55),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xff32DEF7),Color(0xff3295F7),Color(0xff3295F7)]),
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
      child: Text(title,textAlign: TextAlign.center,style: TextStyle(fontSize: ScreenAdapter.setSize(24),color: Colors.white),),
    );
  }
  @override
  HomePresenter createPresenter() {
    // TODO: implement createPresenter
    return HomePresenter();
  }
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
