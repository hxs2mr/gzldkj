import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gzldtechnology/base/base_state.dart';
import 'package:gzldtechnology/pages/my/presenter/my_presenter.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';
import 'package:gzldtechnology/widgets/topbar/top_widget.dart';

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
    ScreenAdapter.init(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TopWidget(tag:3,title: "我的",)
              ],
            ),
          )

      ),

    );
  }

  @override
  MyPresenter createPresenter() {
    // TODO: implement createPresenter
    return MyPresenter();
  }
}
