import 'package:blocbuster/common/screenutils/screen_utils.dart';
import 'package:flutter/material.dart';

import 'journeys/home/home_screen.dart';
import 'themes/app_color.dart';
import 'themes/theme_text.dart';

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
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
    );
  }
}
