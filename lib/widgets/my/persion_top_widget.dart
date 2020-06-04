import 'package:flutter/material.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';
import 'package:gzldtechnology/utils/toast.dart';
//create by :xs
//day by2020/6/4.
//describe:
class PersionTopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Toast.show("点击");
      },
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          margin: EdgeInsets.fromLTRB( ScreenAdapter.width(20.0),ScreenAdapter.width(25.0), ScreenAdapter.width(20.0),0),
          child:_buildTitleView())
    );
  }
  Widget _buildTitleView() {
    return Container(
      height: ScreenAdapter.height(80),
      margin: EdgeInsets.fromLTRB(ScreenAdapter.width(20), 0,  ScreenAdapter.height(15), ScreenAdapter.height(5)),
      child: Row(
        children: <Widget>[
          Container(
            child: Image.asset("assets/images/icon_p0.png",width: ScreenAdapter.width(48),height: ScreenAdapter.height(48),),
          ),
//          Gaps.buildWGaps(25.0),
          Container(
            margin: EdgeInsets.only(left: ScreenAdapter.width(15)),
            child: Text(
              "我的资产",
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
    );
  }
}
