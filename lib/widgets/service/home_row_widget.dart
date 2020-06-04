import 'package:flutter/material.dart';
import 'package:gzldtechnology/utils/color.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';

//create by :xs
//day by2020/6/3.
//describe:标题+子child
class HomeRowWidget extends StatelessWidget {
  const HomeRowWidget(
      {Key key, this.title, this.child, this.onPressed, this.flag})
      : super(key: key);
  final String title;
  final Widget child;
  final GestureTapCallback onPressed;
  final flag;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        margin: EdgeInsets.fromLTRB( ScreenAdapter.width(20.0),0, ScreenAdapter.width(20.0), ScreenAdapter.width(15.0)),
        child: new Column(
          children: <Widget>[_buildTitleView(), child],
        ));
  }

  Widget _buildTitleView() {
    return Container(
      margin: EdgeInsets.fromLTRB(ScreenAdapter.width(20), ScreenAdapter.height(20),  ScreenAdapter.height(15), ScreenAdapter.height(15)),
      child: Row(
        children: <Widget>[
          Container(
            color: ColorR.btn_blue,
            height: ScreenAdapter.height(28),
            width: ScreenAdapter.width(8),
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
              child: Opacity(
                opacity: flag,
                child: InkWell(
                  onTap:flag==1.0? onPressed:null,
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
              )),
          Opacity(
            opacity: flag,
            child: InkWell(
              onTap:flag==1.0? onPressed:null,
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Color(0xff999999),
                size: ScreenAdapter.setSize(35),
              ),
            ),
          )
        ],
      ),
    );
  }
}
