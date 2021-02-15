import 'package:blocbuster/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {
  final navigatorKey;
  final Widget child;

  const WiredashApp(
      {Key key, @required this.navigatorKey, @required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Wiredash(
        projectId: 'blocbuster-eud2g38',
        secret: 'orkzoygqx03qgy7yzdk0ga1165pdhmsfgtwv64wbqwddkp8a',
        navigatorKey: navigatorKey,
        options: WiredashOptionsData(),
        theme: WiredashThemeData(
          brightness: Brightness.dark,
          primaryColor: AppColor.royalBlue,
          secondaryColor: AppColor.violet,
          secondaryBackgroundColor: AppColor.vulcan,
          dividerColor: AppColor.vulcan,
        ),
        child: child);
  }
}
