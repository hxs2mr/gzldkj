import 'package:flutter/material.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';

//xs
//顶部背景
class TopToolBack extends StatelessWidget {
  final int tag;
  const TopToolBack({Key key, this.tag}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(tag==1?"assets/images/service_back.png":"assets/images/icon_top_back.png",
        fit:  BoxFit.fill,
        width: MediaQuery.of(context).size.width,
        height: tag==1?ScreenAdapter.height(290):ScreenAdapter.height(440),
      ),
    );
  }
}
