import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gzldtechnology/base/base_state.dart';
import 'package:gzldtechnology/pages/my/presenter/my_presenter.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';
import 'package:gzldtechnology/widgets/topbar/top_toolback.dart';
import 'package:gzldtechnology/widgets/topbar/top_toolbar.dart';

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
          body: Container(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  TopToolBack(tag: 1,),
                  TopToolBar(title: "我的",),

                  Container(
                      padding: EdgeInsets.only(top: ScreenAdapter.height(130)),
                      child:ListView(
                        padding: EdgeInsets.all(0),
                        children: [


                        ],
                      )
                  )


                ],
              )




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
