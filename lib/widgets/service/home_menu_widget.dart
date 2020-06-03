import 'package:flutter/material.dart';
import 'package:gzldtechnology/utils/color.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';
import 'package:gzldtechnology/utils/sps.dart';
import 'package:gzldtechnology/utils/toast.dart';
//create by :xs
//day by2020/6/3.
//describe:首页图标

class HomeMenuWidget extends StatelessWidget {
  const HomeMenuWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Column(
      children: <Widget>[
        buildBarOne(),
        buildBarTwo()
      ],
    );
  }

  Widget buildBarOne(){
    return  Container(
        height: ScreenAdapter.height(230.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        margin: EdgeInsets.fromLTRB(
            ScreenAdapter.width(19.0),
            ScreenAdapter.width(20.0),
            ScreenAdapter.width(19.0),
            ScreenAdapter.width(0.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            buildBar("企业展示","assets/images/icon_service_bar1.png",1),
            buildBar("注册企业","assets/images/icon_service_bar2.png",2),
            buildBar("我的企业","assets/images/icon_service_bar3.png",3),
          ],
        ),
      );
  }

  Widget buildBarTwo(){
    return  Container(
      height: ScreenAdapter.height(230.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      margin: EdgeInsets.fromLTRB(
          ScreenAdapter.width(19.0),
          ScreenAdapter.width(20.0),
          ScreenAdapter.width(19.0),
          ScreenAdapter.width(0.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          buildBar("董事会","assets/images/icon_service_bar4.png",4),
          buildBar("监事会","assets/images/icon_service_bar5.png",5),
          buildBar("管理层","assets/images/icon_service_bar6.png",6),

        ],
      ),
    );
  }

  Widget buildBar(title,url,flag){
      return  Container(
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                url,
                height: ScreenAdapter.height(120.0),
                width: ScreenAdapter.width(120.0),
              ),
              Sps.buildHGaps(6.0),
              Text(
                title,
                style: TextStyle(
                  color: ColorR.text_dark,
                  fontSize: ScreenAdapter.setSize(28.0),
                ),
              )
            ],
          ),
          onTap: () {
            //Navigator.of(context).pushNamed(Routers.entrance);
            Toast.show("点击"+flag.toString());
          },
        ),
      );

  }
}