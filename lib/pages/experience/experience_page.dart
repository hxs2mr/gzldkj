import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gzldtechnology/base/base_state.dart';
import 'package:gzldtechnology/pages/experience/presenter/experience_presenter.dart';
import 'package:gzldtechnology/utils/color.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';
import 'package:gzldtechnology/utils/sps.dart';
import 'package:gzldtechnology/utils/toast.dart';
import 'package:gzldtechnology/widgets/experience/expper_box_widget.dart';
import 'package:gzldtechnology/widgets/service/home_row_title.dart';
import 'package:gzldtechnology/widgets/service/home_row_widget.dart';
import 'package:gzldtechnology/widgets/service/service_video_widget.dart';
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

class ExperiencePageState extends BaseState<ExperiencePage,ExperiencePresenter> with AutomaticKeepAliveClientMixin {
  List<String> banner = [
    "http://file03.sg560.com/upimg01/2016/07/927234/title/1422127071194161927234.jpg",
    "http://dealer2.autoimg.cn/dealerdfs/g11/M12/6C/E6/autohomedealer__wKgH0lf8rFqAFKlaAByZmQNPjwA045.JPG"
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                            top: ScreenAdapter.height(145)),
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.all(0),
                          children: [
                            TopBannerWidget(
                              listData: banner,
                            ),
                            ExpperBoxWidget(),
                            Sps.buildHGaps(20.0),
                            HomeRowWidget(
                              title: "智能服务体验中心展示",
                              flag: 1.0,
                              onPressed: () {
                                Toast.show("点击");
                                //NavigatorUtil.goVideoClassfyPage(context,StringRes.home_title2,"1");
                              },
                              child: ServiceVideoWidget(url: 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3407102914,1172401035&fm=26&gp=0.jpg',),
                            ),
                            HomeRowTitle(
                              title: "智能服务体验中心筹备处",
                              tag: 2,
                              onPressed: () {
                                Toast.show("点击");
                              },
                            )
                          ],
                        )
                    ),
                    Positioned(
                      right: ScreenAdapter.width(1),
                      bottom: ScreenAdapter.height(60),
                      child:InkWell(
                        child: Image.asset("assets/images/icon_exper_b.png",width: ScreenAdapter.width(135),height: ScreenAdapter.height(135),),
                        onTap: (){
                          Toast.show("你好！");
                        },
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}


