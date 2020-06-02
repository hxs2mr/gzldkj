
import 'package:flutter/material.dart';
import 'package:gzldtechnology/base/base_state.dart';
import 'package:gzldtechnology/pages/service/presenter/service_presenter.dart';
//create by :xs
//day by2020/6/2.
//describe:服务中心

class ServicePage extends StatefulWidget {
  @override
  ServicePageState createState() => ServicePageState();
}

class ServicePageState extends BaseState<ServicePage,ServicePresenter> {

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("服务中心"),);
  }

  @override
  ServicePresenter createPresenter() {
    // TODO: implement createPresenter
    return ServicePresenter();
  }
}
