import 'dart:io';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gzldtechnology/pages/tab/tab_page.dart';
import 'package:gzldtechnology/routers/routers.dart';
import 'package:gzldtechnology/utils/local.dart';
import 'package:oktoast/oktoast.dart';

void main() {

  runApp(MyApp());
  ///强制竖屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    //setupLocator();
  });
  ///透明状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final router=Router();
    Routers.configureRouters(router);
    return OKToast(child: MaterialApp(
      navigatorKey: Routers.navigatorKey,
      title: '',
      theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: Colors.white,
          backgroundColor: Color(0xfff2f2f2),
          appBarTheme: AppBarTheme(color: Colors.white, elevation: 1.0)),

      home: TabPage(),
      debugShowCheckedModeBanner: false,
      //去除右上角Debug标签
      localizationsDelegates: const [
        //国际化g
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        const FallbackCupertinoLocalisationsDelegate(),
      ],
      locale: const Locale("en", "US"),
      supportedLocales: Platform.isIOS ? ios : android,
    ),
        backgroundColor: Colors.black54,
        textPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.bottom);
  }
}


List<Locale> android = [
  const Locale('zh', 'CH'),
  const Locale('en', 'US'),
];
List<Locale> ios = [
  const Locale('en', 'US'),
  const Locale('zh', 'CH'),
];

class NavigateService {
  final GlobalKey<NavigatorState> key = GlobalKey(debugLabel: 'navigate_key');

  NavigatorState get navigator => key.currentState;

  get pushNamed => navigator.pushNamed;

  get push => navigator.push;
}