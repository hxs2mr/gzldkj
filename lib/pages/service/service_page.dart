import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gzldtechnology/base/base_state.dart';
import 'package:gzldtechnology/pages/service/presenter/service_presenter.dart';
import 'package:gzldtechnology/utils/color.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';
import 'package:gzldtechnology/utils/sps.dart';
import 'package:gzldtechnology/utils/toast.dart';
import 'package:gzldtechnology/widgets/service/home_menu_widget.dart';
import 'package:gzldtechnology/widgets/service/home_row_title.dart';
import 'package:gzldtechnology/widgets/service/home_row_widget.dart';
import 'package:gzldtechnology/widgets/service/service_video_widget.dart';
import 'package:gzldtechnology/widgets/topbar/top_banner_widget.dart';
import 'package:gzldtechnology/widgets/topbar/top_toolback.dart';
import 'package:gzldtechnology/widgets/topbar/top_toolbar.dart';

//create by :xs
//day by2020/6/2.
//describe:服务中心
const APPBAR_SCROLL_OFFSET = 100;
class ServicePage extends StatefulWidget {
  @override
  ServicePageState createState() => ServicePageState();
}

class ServicePageState extends BaseState<ServicePage, ServicePresenter> with AutomaticKeepAliveClientMixin{
  List<String>  banner=[
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591160592618&di=628dbee5cb9e65bb00810c240ad42e89&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fupload%2F20170309%2F61859dee36f346e9acdf595752440769_th.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591166327878&di=dc8c43d9ba8e258489e978b55d6135e4&imgtype=0&src=http%3A%2F%2Fa3.att.hudong.com%2F80%2F49%2F20300000861164130821490547828.jpg"
  ];

  double appBarAlpha = 0;

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
                        TopToolBar(title: "服务中心",),
                        Container(
                          padding: EdgeInsets.only(top: ScreenAdapter.height(145)),
                          child:ListView(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.all(0),
                            children: [
                              TopBannerWidget(
                                listData: banner,
                              ),
                              HomeMenuWidget(),
                              Sps.buildHGaps(20.0),
                              HomeRowWidget(
                                title: "企业智能服务中心展示",
                                flag: 1.0,
                                onPressed: () {
                                  Toast.show("点击");
                                  //NavigatorUtil.goVideoClassfyPage(context,StringRes.home_title2,"1");
                                },
                                child: ServiceVideoWidget(url: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591248155351&di=85368d5caeefe237492316407cf919e8&imgtype=0&src=http%3A%2F%2Fb.hiphotos.baidu.com%2Fbaike%2Fpic%2Fitem%2F4034970a304e251f6c4e6ddca586c9177f3e535d.jpg",),
                              ),
                              HomeRowTitle(
                                title: "企业智能服务中心筹备处",
                                tag: 1,
                                onPressed: () {
                                  Toast.show("点击");
                                },
                              )
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
  ServicePresenter createPresenter() {
    // TODO: implement createPresenter
    return ServicePresenter();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
