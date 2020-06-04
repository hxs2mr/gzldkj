import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:gzldtechnology/utils/color.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';
import 'package:gzldtechnology/utils/toast.dart';


//create by :xs
//day by2020/6/4.
//describe:通知组件

class ShopNotice extends StatefulWidget {
  ShopNotice({this.model,this.onPressed});
  final model;
  final GestureTapCallback onPressed;
  @override
  _ShopNoticeState createState() => _ShopNoticeState();
}

class _ShopNoticeState extends State<ShopNotice> {
  List<String> listData = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      margin: EdgeInsets.fromLTRB(ScreenAdapter.width(20), ScreenAdapter.height(20), ScreenAdapter.width(20), 0),
      height: ScreenAdapter.height(80.0),

//      padding: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(12.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: ScreenAdapter.width(20)),
            child: Image.asset(
              'assets/images/ic_notice.png',
              width: ScreenAdapter.width(28.0),
              height: ScreenAdapter.height(28.0),
              fit: BoxFit.fill,
            ),
          ),
          _buildFutureNews(),

          InkWell(
              onTap:widget.onPressed,
              child: new Text(
                '更多',
                style: TextStyle(
                  color: Color(0xff999999),
                  fontSize: ScreenAdapter.setSize(24.0),
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          Container(
            margin: EdgeInsets.only(right:ScreenAdapter.width(10)),
            child: InkWell(
              onTap:widget.onPressed,
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Color(0xff999999),
                size: ScreenAdapter.setSize(35),
              ),
            ),
          )
         // Sps.buildWGaps(10)
        ],
      ),
    );
  }

  ///新闻轮播组件
  Widget _buildFutureNews() {
    listData = widget.model;
    if (listData.length > 0) {
      return _buildSwiper(listData);
    } else {
      return Expanded(
        child: _buildTextCtr("暂无新闻查看!"),
      );
    }
  }

  ///文字轮播
  Widget _buildSwiper(List<String> listData) {
    return Expanded(
      child: new Swiper(
        duration: 2500,
        scrollDirection: Axis.vertical,
        autoplay: true,
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildTextCtr(listData[index]);
        },
        onTap: (index) {
          Toast.show("点击");
         // NavigatorUtil.goWebViewPage(context, listData[index].msg, listData[index].redirectUrl);
          //NavigatorUtil.goNewsDetail(context, listData[index].id);
        },
      ),
    );
  }

  ///新闻文字
  Widget _buildTextCtr(title) {
    return Container(
      padding: EdgeInsets.only(left: ScreenAdapter.width(20.0)),
      alignment: Alignment.centerLeft,
      child: Text(
        '$title',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          fontSize: ScreenAdapter.setSize(25.0),
          color: ColorR.text_4444
        ),
      ),
    );
  }
}