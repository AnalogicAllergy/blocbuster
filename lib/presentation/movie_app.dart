import 'package:blocbuster/common/screenutils/screen_utils.dart';
import 'package:blocbuster/presentation/wiredash_app.dart';
import 'package:flutter/material.dart';

import 'journeys/home/home_screen.dart';
import 'themes/app_color.dart';
import 'themes/theme_text.dart';

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return WiredashApp(
      navigatorKey: _navigatorKey,
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        title: "Movie App",
        theme: ThemeData(
            primaryColor: AppColor.vulcan,
            scaffoldBackgroundColor: AppColor.vulcan,
            accentColor: AppColor.royalBlue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: ThemeText.getTextTheme(),
            appBarTheme: const AppBarTheme(elevation: 0)),
        home: HomeScreen(),
      ),
    );
  }
}
