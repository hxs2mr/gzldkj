import 'package:flutter/material.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';

//create by :xs
//day by2020/6/3.
//describe:标题+子child
class HomeRowTitle extends StatelessWidget {
  const HomeRowTitle(
      {Key key, this.title, this.onPressed,this.tag})
      : super(key: key);
  final String title;
  final GestureTapCallback onPressed;
  final tag;
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
    return Container(
      height: ScreenAdapter.height(80),
      margin: EdgeInsets.fromLTRB(ScreenAdapter.width(20), 0,  ScreenAdapter.height(15), ScreenAdapter.height(5)),
      child: Row(
        children: <Widget>[
          Container(    
            child: Image.asset(tag==1?"assets/images/icon_service_bo.png":"assets/images/icon_zhi.png",width: ScreenAdapter.width(48),height: ScreenAdapter.height(48),),
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
              child:   InkWell(
                  onTap:onPressed,
                  child: new Text(
                    '查看详情',
                    style: TextStyle(
                      color: Color(0xff999999),
                      fontSize: ScreenAdapter.setSize(24.0),
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),

          ),
           InkWell(
              onTap:onPressed,
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Color(0xff999999),
                size: ScreenAdapter.setSize(35),
              ),

          )
        ],
      ),
    );
  }
}
