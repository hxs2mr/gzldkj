//create by :xs
//day by2020/6/2.
//describe:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlatColumnButton extends StatelessWidget {
  const FlatColumnButton(
      {Key key, this.icon, this.label, this.labelColor, this.onPressed})
      : super(key: key);

  final VoidCallback onPressed;
  final Widget icon;
  final String label;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: new FlatButton(
          padding: EdgeInsets.all(ScreenUtil().setSp(5.0)),
          shape: CircleBorder(),
          onPressed: onPressed,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              icon,
              new Text(
                label,
                style: TextStyle(
                    color: labelColor, fontSize: ScreenUtil().setSp(26)),
              )
            ],
          )),
    );
  }
}