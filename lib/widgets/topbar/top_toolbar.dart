import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';

//create by :xs
//day by2020/6/3.
//describe:头部复用
class TopToolBar extends StatelessWidget {

  final String title;
  const TopToolBar({Key key,this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: ScreenAdapter.height(130),
        width: double.infinity,
        child:  AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(title,textAlign:TextAlign.center,style: TextStyle(fontSize: ScreenAdapter.setSize(38),color: Colors.white),))
    );
  }
}

