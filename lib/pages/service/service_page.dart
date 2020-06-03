import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gzldtechnology/base/base_state.dart';
import 'package:gzldtechnology/pages/service/presenter/service_presenter.dart';
import 'package:gzldtechnology/utils/color.dart';
import 'package:gzldtechnology/utils/sps.dart';
import 'package:gzldtechnology/utils/toast.dart';
import 'package:gzldtechnology/widgets/service/home_menu_widget.dart';
import 'package:gzldtechnology/widgets/service/home_row_title.dart';
import 'package:gzldtechnology/widgets/service/home_row_widget.dart';
import 'package:gzldtechnology/widgets/service/service_video_widget.dart';
import 'package:gzldtechnology/widgets/topbar/top_widget.dart';

//create by :xs
//day by2020/6/2.
//describe:服务中心
const APPBAR_SCROLL_OFFSET = 100;
class ServicePage extends StatefulWidget {
  @override
  ServicePageState createState() => ServicePageState();
}

class ServicePageState extends BaseState<ServicePage, ServicePresenter> {

  double appBarAlpha = 0;
  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if(alpha < 0) {
      alpha = 0;
    } else if(alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(appBarAlpha);
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
          backgroundColor: ColorR.gray_f5,
          body: Container(
            child: Stack(
              children: <Widget>[
                ListView(
                  padding: EdgeInsets.all(0),
                  children: <Widget>[
                    TopWidget(
                      tag: 1,
                      title: "服务中心",
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
                      child: ServiceVideoWidget(),
                    ),
                    HomeRowTitle(
                      title: "企业智能服务中心筹备处",
                      onPressed: () {
                        Toast.show("点击");
                      },
                    )
                  ],
                ),


              ],
            ),
          )),
    );
  }

  @override
  ServicePresenter createPresenter() {
    // TODO: implement createPresenter
    return ServicePresenter();
  }
}
