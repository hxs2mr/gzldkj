import 'package:flutter/material.dart';
import 'package:gzldtechnology/base/base_state.dart';
import 'package:gzldtechnology/pages/shop/presenter/shop_presenter.dart';
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
    return Center(
      child: Text("商城"),
    );
  }

  @override
  ShopPresenter createPresenter() {
    // TODO: implement createPresenter
    return ShopPresenter();
  }
}
