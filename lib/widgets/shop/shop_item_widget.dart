import 'package:flutter/material.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';
import 'package:gzldtechnology/utils/toast.dart';
//create by :xs
//day by2020/6/4.
//describe:商城底部组件

class ShopItemWidget extends StatelessWidget {
  final tag;
  const ShopItemWidget({Key key, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.fromLTRB( ScreenAdapter.width(20.0),ScreenAdapter.height(15), ScreenAdapter.width(20.0), 0),
      child: InkWell(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(ScreenAdapter.width(20.0)),
          child: Image.asset(tag==1?"assets/images/shop_box1.png":tag==2?"assets/images/shop_box2.png":"assets/images/shop_box3.png",height: ScreenAdapter.height(204),),
        ),
        onTap: (){
          Toast.show("点击"+tag.toString());
        },
      ),
    );
  }
}

