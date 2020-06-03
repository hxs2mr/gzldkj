import 'package:flutter/cupertino.dart';

//create by :xs
//day by2020/6/2.
//describe:

class FallbackCupertinoLocalisationsDelegate extends LocalizationsDelegate<CupertinoLocalizations>{

  const FallbackCupertinoLocalisationsDelegate();
  @override
  bool isSupported(Locale locale)=>true;

  @override
  Future<CupertinoLocalizations> load(Locale locale)=>DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<CupertinoLocalizations> old)=>false;

}
