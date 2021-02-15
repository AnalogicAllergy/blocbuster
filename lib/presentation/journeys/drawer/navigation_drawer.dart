import 'package:blocbuster/common/constants/size_constants.dart';
import 'package:blocbuster/common/extensions/size_extension.dart';
import 'package:blocbuster/presentation/journeys/drawer/navigation_expanded_list_item.dart';
import 'package:blocbuster/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:blocbuster/presentation/widgets/app_dialog.dart';
import 'package:blocbuster/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4),
      ]),
      width: Sizes.dimen_300.w,
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: Sizes.dimen_8.h,
                bottom: Sizes.dimen_18.h,
                left: Sizes.dimen_8.w,
                right: Sizes.dimen_8.w),
            child: Logo(height: Sizes.dimen_20.h),
          ),
          NavigationListItem(
            title: "Favorite movies",
            onPressed: () {},
          ),
          NavigationExpandedListItem(
            title: "Language",
            onPressed: () {},
            children: ["English", "Spanish"],
          ),
          NavigationListItem(
            title: "Feedback",
            onPressed: () {
              //close the nav drawer before invoking wiredash
              Navigator.of(context).pop();
              Wiredash.of(context).show();
            },
          ),
          NavigationListItem(
            title: "About",
            onPressed: () {
              Navigator.of(context).pop();
              _showDialog(context);
            },
          ),
        ],
      )),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        child: AppDialog(
          title: "BloCBuster",
          buttonText: "Okay",
          description: "Made with TMDB API with Love",
          image: Image.asset('assets/pngs/tmdb_logo.png',
              height: Sizes.dimen_32.h),
        ));
  }
}
