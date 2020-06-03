import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gzldtechnology/base/base_state.dart';
import 'package:gzldtechnology/pages/shop/presenter/shop_presenter.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';
import 'package:gzldtechnology/widgets/topbar/top_widget.dart';
//create by :xs
//day by2020/6/2.
//describe:商场
class ShopPage extends StatefulWidget {
  @override
  ShopPageState createState() => ShopPageState();
}

class ShopPageState extends BaseState<ShopPage,ShopPresenter> {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TopWidget(tag:0,title: "商城",)
                ],
              ),
            )

      ),

    );
  }

  @override
  ShopPresenter createPresenter() {
    // TODO: implement createPresenter
    return ShopPresenter();
  }
}
