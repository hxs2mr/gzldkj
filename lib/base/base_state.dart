//create by :xs
//day by2020/6/2.
//describe:flutterState的状态基类

import 'package:flutter/material.dart';
import 'package:gzldtechnology/base/bas_presenter.dart';
import 'package:gzldtechnology/base/base_view.dart';
import 'package:gzldtechnology/utils/toast.dart';
import 'package:gzldtechnology/utils/utils.dart';
import 'package:gzldtechnology/widgets/progress_dialog.dart';

abstract class BaseState<T extends StatefulWidget,V extends BasePresenter> extends State<T>  implements BaseView{

  V presenter;

  V createPresenter();

  BaseState() {
    presenter = createPresenter();
    presenter.view = this;
  }
  @override
  BuildContext getContext() {
    // TODO: implement getContext
    return context;
  }
  bool _isShowDialog = false;
  @override
  void hideLoading() {
    if (mounted && _isShowDialog){
      _isShowDialog = false;
    // NavigatorUtil.goBack(context);
    }
  }
  @override
  void showLoading() {
    /// 避免重复弹出
    if (mounted && !_isShowDialog){
      _isShowDialog = true;
      try{
        showTransparentDialog(
            context: context,
            barrierDismissible: false,
            builder:(_) {
              return WillPopScope(
                onWillPop: () async {
                  // 拦截到返回键，证明dialog被手动关闭
                  _isShowDialog = false;
                  return Future.value(true);
                },
                child: const ProgressDialog(hintText: "加载中..."),
              );
            }
        );
      }catch(e){
        /// 异常原因主要是页面没有build完成就调用Progress。
        print(e);
      }
    }
  }
  @override
  void showToast(String msg) {
    Toast.show(msg);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    presenter?.disposePresenter();
  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    presenter?.deactivatePresenter();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    presenter?.initPresenter();
  }

}
