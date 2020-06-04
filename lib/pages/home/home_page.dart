import 'package:flutter/material.dart';
import 'package:gzldtechnology/base/base_state.dart';
import 'package:gzldtechnology/pages/home/presenter/home_presenter.dart';

//create by :xs
//day by2020/6/2.
//describe:首页
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends BaseState<HomePage,HomePresenter>with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Text("首页"),
    );
  }
  
  @override
  HomePresenter createPresenter() {
    // TODO: implement createPresenter
    return HomePresenter();
  }
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
