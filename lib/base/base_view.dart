//create by :xs
//day by2020/6/2.
//describe:view的基类


import 'package:flutter/material.dart';
import 'package:gzldtechnology/base/lifecycle.dart';

abstract class BaseView{
   BuildContext getContext();

   //显示加载loading
   void showLoading();

   //隐藏loading
   void hideLoading();

   //显示吐司
   void showToast(String msg);


}
abstract class IPresenter extends LifeCycle{}