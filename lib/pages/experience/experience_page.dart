import 'package:flutter/material.dart';
import 'package:gzldtechnology/base/base_state.dart';
import 'package:gzldtechnology/pages/experience/presenter/experience_presenter.dart';
//create by :xs
//day by2020/6/2.
//describe:体验中心

class ExperiencePage extends StatefulWidget {
  @override
  ExperiencePageState createState() => ExperiencePageState();
}

class ExperiencePageState extends BaseState<ExperiencePage,ExperiencePresenter> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("体验中心"),
    );
  }

  @override
  ExperiencePresenter createPresenter() {
    // TODO: implement createPresenter
    return ExperiencePresenter();
  }
}
