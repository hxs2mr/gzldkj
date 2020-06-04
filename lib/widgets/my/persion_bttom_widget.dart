import 'package:flutter/material.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';
import 'package:gzldtechnology/utils/sps.dart';
import 'package:gzldtechnology/utils/toast.dart';
//create by :xs
//day by2020/6/4.
//describe:
class PersionBottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          margin: EdgeInsets.fromLTRB( ScreenAdapter.width(20.0),0, ScreenAdapter.width(20.0), ScreenAdapter.width(35.0)),
          child:_buildTitleView());
  }
  Widget _buildTitleView() {
    return  Column(
      children: <Widget>[
        buildItem("assets/images/icon_share.png","分享",5),
        Sps.hPure660,
        buildItem("assets/images/icon_ju.png","举报",6),
        Sps.hPure660,
        buildItem("assets/images/icon_our.png","关于我们",7),
      ],
    );

  }
  Widget  buildItem(url,title,i){
    return  InkWell(

      child: Container(
        height: ScreenAdapter.height(80),
        margin: EdgeInsets.fromLTRB(ScreenAdapter.width(20), 0,  ScreenAdapter.height(15), ScreenAdapter.height(5)),
        child: Row(
          children: <Widget>[
            Container(
              child: Image.asset(url,width: ScreenAdapter.width(48),height: ScreenAdapter.height(48),),
            ),
//          Gaps.buildWGaps(25.0),
            Container(
              margin: EdgeInsets.only(left: ScreenAdapter.width(15)),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: ScreenAdapter.setSize(28.0),
                    textBaseline: TextBaseline.ideographic,
                    color: Color(0xff444444)
                ),
                textAlign: TextAlign.center,

              ),
            ),
            Expanded(
              flex: 1,
              child:    new Text(
                '',
                style: TextStyle(
                  color: Color(0xff999999),
                  fontSize: ScreenAdapter.setSize(24.0),
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.right,
              ),

            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: Color(0xff999999),
              size: ScreenAdapter.setSize(35),
            ),

          ],
        ),
      ),
      onTap: (){
        jumpSwitch(i);
      },
    )  ;
  }
  void jumpSwitch(int i){

    Toast.show("点击"+i.toString());
    switch (i){
      case 1:

        break;

    }
  }
}
