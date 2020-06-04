

//create by :xs
//day by2020/6/4.
//describe:聊天发送的按钮


import 'package:flutter/material.dart';
import 'package:gzldtechnology/utils/color.dart';
import 'package:gzldtechnology/utils/function.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';

class HomeIMWidget extends StatelessWidget {
  final Func tileListener;
  final title;
  const HomeIMWidget({ this.tileListener,this.title=" "})  ;
  Widget buildSearchLayout() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 0,0, 0),
        height: ScreenAdapter.height(65.0),
        //修饰黑色背景与圆角
        decoration: BoxDecoration(
          border: Border.all(
              color: ColorR.search_bar_bg,
              width: ScreenAdapter.width(1.0)), //灰色的一层边框
          color: Colors.white,
          borderRadius: new BorderRadius.all(Radius.circular(10)),
        ),
        child: TextField(
          keyboardType: TextInputType.text,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: title,
            hintStyle: TextStyle(
              color: Color(0xFF999999),
              fontSize: ScreenAdapter.setSize(30),
            ),
            // contentPadding: EdgeInsets.fromLTRB(ScreenAdapter.width(5), 0, 0, 0),
            filled: true,
            fillColor: Colors.transparent,
            border: InputBorder.none,
          ),
          cursorColor: Colors.blue,
          onChanged: (str) {
            //  print(str);
          },
          onSubmitted: (str){
            tileListener(str);
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    Widget editView() {
      return Container(
          alignment: Alignment.center,
          height: ScreenAdapter.height(120.0),
          child: buildSearchLayout()
      );
    }
    return editView();
  }
}