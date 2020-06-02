//create by :xs
//day by2020/6/2.
//describe:Presenter的基类
import 'package:dio/dio.dart';
import 'base_view.dart';


class BasePresenter<V extends BaseView>extends IPresenter{
  V view;
  CancelToken _cancelToken;

  @override
  void deactivatePresenter() {

  }

  @override
  void disposePresenter() {
    //请求取消
    if(_cancelToken!=null){
      if(_cancelToken.isCancelled){
        _cancelToken.cancel();
      }
    }
  }

  @override
  void initPresenter() {
  }



}