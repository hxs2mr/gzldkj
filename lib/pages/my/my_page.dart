import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gzldtechnology/base/base_state.dart';
import 'package:gzldtechnology/pages/my/presenter/my_presenter.dart';
import 'package:gzldtechnology/utils/color.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';
import 'package:gzldtechnology/widgets/my/persion_bttom_widget.dart';
import 'package:gzldtechnology/widgets/my/persion_center_widget.dart';
import 'package:gzldtechnology/widgets/my/persion_top_widget.dart';
import 'package:gzldtechnology/widgets/my/person_widget.dart';
import 'package:gzldtechnology/widgets/topbar/top_toolback.dart';
import 'package:gzldtechnology/widgets/topbar/top_toolbar.dart';

//create by :xs
//day by2020/6/2.
//describe:个人中心

class MyPage extends StatefulWidget {
  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends BaseState<MyPage,MyPresenter>with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenAdapter.init(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
          backgroundColor: ColorR.gray_f5,
          body: Container(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  TopToolBack(tag: 1,),
                  TopToolBar(title: "我的",),

                  Container(
                      padding: EdgeInsets.only(top: ScreenAdapter.height(145)),
                      child:ListView(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.all(0),
                        children: [
                          PersonWidget(header: "http://pic2.zhimg.com/50/v2-fe6d519908eee190fbe3abd624f31b46_hd.jpg",tag: 1,),
                          PersionTopWidget(),
                          PersionCenterWidget(),
                          PersionBottomWidget()

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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive =>true;
}
