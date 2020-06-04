import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gzldtechnology/base/base_state.dart';
import 'package:gzldtechnology/pages/shop/presenter/shop_presenter.dart';
import 'package:gzldtechnology/utils/color.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';
import 'package:gzldtechnology/utils/toast.dart';
import 'package:gzldtechnology/widgets/shop/shop_item_widget.dart';
import 'package:gzldtechnology/widgets/shop/shop_notice.dart';
import 'package:gzldtechnology/widgets/topbar/top_banner_widget.dart';
import 'package:gzldtechnology/widgets/topbar/top_toolback.dart';
import 'package:gzldtechnology/widgets/topbar/top_toolbar.dart';
//create by :xs
//day by2020/6/2.
//describe:商场
class ShopPage extends StatefulWidget {
  @override
  ShopPageState createState() => ShopPageState();
}

class ShopPageState extends BaseState<ShopPage,ShopPresenter>with AutomaticKeepAliveClientMixin {
  List<String>  banner=[
    "http://static.loupan.com/upfile/image/20130819/20130819111154_77374.jpg",
    "http://5b0988e595225.cdn.sohucs.com/images/20180825/462d8c71ecd04b94a8306e8a8872c405.jpeg"
  ];
  List<String> notice=[
    "测试一下 兄弟奥术大师大所大Asdasd",
    "阿斯加德卡老师打大龙大了答案了散啦身法房卡卡卡"
  ];
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
                  TopToolBack(tag: 0,),
                  TopToolBar(title: "商城",),

                  Container(
                      padding: EdgeInsets.only(top: ScreenAdapter.height(145)),
                      child:ListView(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.all(0),
                        children: [
                          TopBannerWidget(
                            listData: banner,
                          ),
                          ShopNotice(model: notice,onPressed: (){
                            Toast.show("点击更多");
                          },),
                          ShopItemWidget(
                            tag: 1,
                          ),
                          ShopItemWidget(
                            tag: 2,
                          ),
                          ShopItemWidget(
                            tag: 3,
                          ),
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
  ShopPresenter createPresenter() {
    // TODO: implement createPresenter
    return ShopPresenter();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
