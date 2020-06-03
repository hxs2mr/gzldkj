import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gzldtechnology/base/base_state.dart';
import 'package:gzldtechnology/pages/experience/presenter/experience_presenter.dart';
import 'package:gzldtechnology/utils/color.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';
import 'package:gzldtechnology/widgets/topbar/top_banner_widget.dart';
import 'package:gzldtechnology/widgets/topbar/top_toolback.dart';
import 'package:gzldtechnology/widgets/topbar/top_toolbar.dart';
//create by :xs
//day by2020/6/2.
//describe:体验中心

class ExperiencePage extends StatefulWidget {
  @override
  ExperiencePageState createState() => ExperiencePageState();
}

class ExperiencePageState extends BaseState<ExperiencePage,ExperiencePresenter> {
  List<String> banner = [
    "http://file03.sg560.com/upimg01/2016/07/927234/title/1422127071194161927234.jpg",
    "http://dealer2.autoimg.cn/dealerdfs/g11/M12/6C/E6/autohomedealer__wKgH0lf8rFqAFKlaAByZmQNPjwA045.JPG"
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
            backgroundColor: ColorR.gray_f5,
            body: Container(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    TopToolBack(tag: 1,),
                    TopToolBar(title: "体验中心",),

                    Container(
                        padding: EdgeInsets.only(
                            top: ScreenAdapter.height(130)),
                        child: ListView(
                          padding: EdgeInsets.all(0),
                          children: [
                            TopBannerWidget(
                              listData: banner,
                            ),

                          ],
                        )
                    )


                  ],
                )


            )
        ));


  }

  @override
  ExperiencePresenter createPresenter() {
    // TODO: implement createPresenter
    return ExperiencePresenter();
  }
}


