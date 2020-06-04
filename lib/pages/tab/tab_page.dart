import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:gzldtechnology/base/base_state.dart';
import 'package:gzldtechnology/pages/experience/experience_page.dart';
import 'package:gzldtechnology/pages/home/home_page.dart';
import 'package:gzldtechnology/pages/my/my_page.dart';
import 'package:gzldtechnology/pages/service/service_page.dart';
import 'package:gzldtechnology/pages/shop/shop_page.dart';
import 'package:gzldtechnology/pages/tab/prsenter/tab_presenter.dart';
import 'package:gzldtechnology/utils/choice_value.dart';
import 'package:gzldtechnology/utils/color.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';
import 'package:gzldtechnology/utils/toast.dart';
import 'package:gzldtechnology/widgets/tab/bottom_location.dart';
import 'package:gzldtechnology/widgets/tab/flat_column_button.dart';

//create by :xs
//day by2020/6/2.
//describe: 底部导航条

class TabPage extends StatefulWidget {
  @override
  TabWidgetState createState() => TabWidgetState();
}

class TabWidgetState extends BaseState<TabPage, TabPresenter>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  var _pageList;
  int currentIndex =1;

  //页面控制器
  PageController _pageController;

  @override
  void initState() {
    _pageController = new PageController(initialPage: 1);
    super.initState();
    initPage();
  }

  ///初始化子页面
  void initPage() {
    _pageList = [
      new ShopPage(),
      new ServicePage(),
      new HomePage(),
      new ExperiencePage(),
      new MyPage(),
    ];
  }
  static const FloatingActionButtonLocation bottomDocked = CenterEndLocation();
  static ChoiceValue<FloatingActionButtonLocation> locationTap =
  ChoiceValue<FloatingActionButtonLocation>(
    title: '初始位',
    label: '导航位',
    value: FloatingActionButtonLocation.centerDocked,
  );

  static const ChoiceValue<FloatingActionButtonLocation> kFabBottomFloat =
  ChoiceValue<FloatingActionButtonLocation>(
    title: '底部位子',
    label: '底部位子',
    value: bottomDocked,
  );

  static const ChoiceValue<FloatingActionButtonLocation> kFabCenterFloat =
  ChoiceValue<FloatingActionButtonLocation>(
    title: '中间位置',
    label: '',
    value: FloatingActionButtonLocation.centerDocked,
  );

  final _nomorColor = Colors.grey;
  final _selectColor = Color(0xff3199FF);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenAdapter.init(context);
    return new WillPopScope(
        onWillPop: _onExit,
        child: Scaffold(
          body: PageView(
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            physics: NeverScrollableScrollPhysics(), // 禁止滑动
            controller: _pageController,
            children: _pageList,
          ),
          floatingActionButton: homeFloatingButton(),
          floatingActionButtonLocation: currentIndex == 2
              ? FloatingActionButtonLocation.centerDocked
              : bottomDocked,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          bottomNavigationBar: BottomAppBar(
              color: Color(0xfff5f5f5),
              elevation: 0.0,
              shape: CircularNotchedRectangle(),
              child: rowHomeButton()),
        ));
  }
  DateTime _lastTime;
  Future<bool> _onExit() {
    if (_lastTime == null ||
        DateTime.now().difference(_lastTime) > Duration(milliseconds: 2500)) {
      _lastTime = DateTime.now();
      Toast.show("再按一次退出");
      return Future.value(false);
    }
    Toast.cancelToast();
    return Future.value(true);
  }

  ///首页按钮
  Widget homeFloatingButton() {
    return Container(
      height: ScreenAdapter.height(105),
      width: ScreenAdapter.width(105),
      child: CircularGradientButton(
        child: Image.asset(
          'assets/images/tab_home.png',
          height: ScreenUtil().setHeight(130),
          width: ScreenUtil().setWidth(130),
        ),
        callback: () {
          currentIndex = 2;
          _pageController.jumpToPage(currentIndex);
          setState(() {
            locationTap = kFabCenterFloat;
          });
        },
        gradient: currentIndex == 2
            ? ColorR.primaryGradient
            : ColorR.whiteGradient,
        shadowColor: Gradients.rainbowBlue.colors.last.withOpacity(0.4),
      ),
    );
  }

  ///报名 和 个人中心按钮
  Widget rowHomeButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,topRight:Radius.circular(20)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatColumnButton(
              ///图片渐变加深
              icon: AnimatedCrossFade(
                duration: Duration(milliseconds: 500),
                firstChild:
                _buildImagesAsset('assets/images/tab_shop_nor.png'),
                secondChild:
                _buildImagesAsset('assets/images/tab_shop_sel.png'),
                crossFadeState: currentIndex != 0
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
              label: "商城",
              labelColor: currentIndex == 0 ? _selectColor : _nomorColor,
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                  locationTap = kFabBottomFloat;
                  _pageController.jumpToPage(currentIndex);
                });
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatColumnButton(
              ///图片渐变加深
              icon: AnimatedCrossFade(
                duration: Duration(milliseconds: 500),
                firstChild:
                _buildImagesAsset('assets/images/tab_express_nor.png'),
                secondChild:
                _buildImagesAsset('assets/images/tab_service_sel.png'),
                crossFadeState: currentIndex != 1
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
              label: "服务中心",
              labelColor: currentIndex == 1 ? _selectColor : _nomorColor,
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                  locationTap = kFabBottomFloat;
                  _pageController.jumpToPage(currentIndex);
                });
              },
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(100.0),
          ),
          Expanded(
            child: FlatColumnButton(
              ///图片渐变加深
              icon: AnimatedCrossFade(
                duration: Duration(milliseconds: 500),
                firstChild:
                _buildImagesAsset('assets/images/tab_express_nor.png'),
                secondChild:
                _buildImagesAsset('assets/images/tab_express_sel.png'),
                crossFadeState: currentIndex != 3
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
              label: "体验中心",
              labelColor: currentIndex == 3 ? _selectColor : _nomorColor,
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                  locationTap = kFabBottomFloat;
                  _pageController.jumpToPage(currentIndex);
                });
              },
            ),
          ),
          Expanded(
            child: FlatColumnButton(
              icon: AnimatedCrossFade(
                duration: Duration(milliseconds: 500),
                firstChild:
                _buildImagesAsset('assets/images/tab_my_nor.png'),
                secondChild:
                _buildImagesAsset('assets/images/tab_my_sel.png'),
                crossFadeState: currentIndex != 4
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
              label: '我的',
              labelColor: currentIndex == 4 ? _selectColor : _nomorColor,
              onPressed: () {
//              _hasToken
//                  ? setState(() {
//                currentIndex = 2;
//                locationTap = kFabBottomFloat;
//                _pageController.jumpToPage(currentIndex);
//              })
//                  : NavigatorUtil.jumpLogin(context); //在未登录的情况下  跳转到登录界面
                setState(() {
                  currentIndex = 4;
                  locationTap = kFabBottomFloat;
                  _pageController.jumpToPage(currentIndex);
                });
              },
            ),
          )
        ],
      )
    ) ;
  }

  ///首页图标
  Widget _buildImagesAsset(images) {
    return Image.asset(
      images,
      width: ScreenUtil().setSp(45.0),
      height: ScreenUtil().setSp(45.0),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  TabPresenter createPresenter() {
    // TODO: implement createPresenter
    return TabPresenter();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}

class CenterEndLocation extends FloatlocationWidget {
  const CenterEndLocation();

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = (scaffoldGeometry.scaffoldSize.width -
        scaffoldGeometry.floatingActionButtonSize.width) /
        2.0;
    return Offset(fabX, getDockedY(scaffoldGeometry));
  }

  @override
  String toString() => 'FloatingActionButtonLocation.endDocked';
}