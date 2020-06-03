import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:gzldtechnology/utils/common/undefined.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';

//create by :xs
//day by2020/6/3.
//describe:顶部banner

class TopBannerWidget extends StatefulWidget {
  TopBannerWidget({@required this.listData});

  final listData;

  @override
  _TopBannerWidgetState createState() => _TopBannerWidgetState();
}

class _TopBannerWidgetState extends State<TopBannerWidget> {
  List<String> listData = [];
  int listDataLength = 0;

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
        padding: EdgeInsets.fromLTRB(
            ScreenAdapter.width(20.0), 0, ScreenAdapter.width(20.0), 0),
        height: ScreenAdapter.height(340.0),
        child: _buildBlocWidget());
  }

  ///请求状
  Widget _buildBlocWidget() {
    if (widget.listData == null) {
      return ContainerTip(
        backgroundColor: Colors.grey,
        label: "网络出错!",
      );
    } else {
      listData = widget.listData;
      if (listData.length > 0) {
        listDataLength = listData.length;
        listData = listData;
        listDataLength = listData.length;
        if (listDataLength == 0) {
          return ContainerTip(
            backgroundColor: Colors.grey,
            label: "暂无数据！",
          );
        } else {
          return _swiperWidget;
        }
      } else {
        return ContainerTip(
          backgroundColor: Colors.grey,
          label: "数据异常！",
        );
      }
    }
  }

  Widget _buildSwierView1(List<String> listData){
    return   Swiper.children(
        duration: 2000,
        autoplay: true,
        pagination: new SwiperPagination(
            margin: EdgeInsets.only(bottom: ScreenAdapter.width(20.0)),
            builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.white,
                activeSize: ScreenAdapter.setSize(15),
                size: ScreenAdapter.setSize(15))),
        children:buildWidgets(listData)

    );
  }
  List<Widget> buildWidgets(List<String> listData){

    List<Widget> lists=[];
    for(int i=0;i< listData.length;i++){
      lists.add(new ClipRRect(
        borderRadius: BorderRadius.circular(ScreenAdapter.width(20.0)),
        child:new CachedNetworkImage(
          imageUrl: listData[i],
          height: ScreenAdapter.height(350.0),
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fitWidth,
        ),
      ),);
    }
    return  lists;
  }
  ///轮播试图
  Widget _buildSwiperView(List<String> listData) {
    return  Swiper(
      duration: 2000,
      itemCount: listDataLength,
      itemBuilder: (BuildContext context, int index) => new ClipRRect(
        borderRadius: BorderRadius.circular(ScreenAdapter.width(20.0)),
        child:new CachedNetworkImage(
          imageUrl: listData[index],
          height: ScreenAdapter.height(340.0),
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
      ),

      autoplay: true,
      //onTap: jumpUrl,
      // autoplay: true,
    );
  }

  Widget get _swiperWidget => _buildSwiperView(listData);

  ///判断类型跳转
  @override
  void dispose() {
    super.dispose();
  }
}
