import 'package:flutter/material.dart';
import 'package:gzldtechnology/base/base_state.dart';
import 'package:gzldtechnology/pages/my/presenter/my_presenter.dart';

//create by :xs
//day by2020/6/2.
//describe:个人中心

class MyPage extends StatefulWidget {
  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends BaseState<MyPage,MyPresenter> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("个人中心"),
    );
  }

  @override
  MyPresenter createPresenter() {
    // TODO: implement createPresenter
    return MyPresenter();
  }
}
