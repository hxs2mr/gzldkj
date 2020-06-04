import 'package:flutter/material.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';
import 'package:gzldtechnology/utils/sps.dart';
import 'package:gzldtechnology/utils/toast.dart';
//create by :xs
//day by2020/6/4.
//describe:体验中心子item
class ExpperBoxWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
     margin: EdgeInsets.fromLTRB( ScreenAdapter.width(20.0),ScreenAdapter.height(20), ScreenAdapter.width(20.0),0),
      alignment: Alignment.center,
      child:Column(

        children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child:   buildItem('assets/images/experience_box1.png','assets/images/icon_exper1.png','明星理财师',1),),
                Sps.buildWGaps(20.0),
                Expanded(child:   buildItem('assets/images/experience_box2.png','assets/images/icon_exper2.png','明星发起人',2) )
              ],
          ),
           Sps.buildHGaps(20.0),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(child:
                buildItem('assets/images/experience_box3.png','assets/images/icon_exper3.png','财商体验区',3)),
                Sps.buildWGaps(20.0),
                Expanded(child:
                buildItem('assets/images/experience_box4.png','assets/images/icon_exper4.png','理财规划服务',4))
              ],
          )

        ],
      )

    );
  }
//'assets/images/experience_box1.png','assets/images/icon_exper1.png'

  Widget buildItem(url1,ur2,title,tag){
    return   InkWell(
        child:  Stack(
          children: <Widget>[
            Image.asset(url1,
              fit: BoxFit.fill,
              height: ScreenAdapter.height(240) ),
            Positioned(
                top: ScreenAdapter.height(46),
                left: ScreenAdapter.width(48),
                child: Image.asset(ur2,height: ScreenAdapter.height(67),
                  width: ScreenAdapter.width(68),)),

            Positioned(
                bottom: ScreenAdapter.height(55),
                left: ScreenAdapter.width(51),
                child: Text(title,style: TextStyle(fontSize: ScreenAdapter.setSize(28),
                    color: Colors.white),))

          ],
        ),
        onTap: (){
            Toast.show("点击"+tag.toString());
        },
    );
  }
}
