import 'package:blocbuster/common/constants/size_constants.dart';
import 'package:blocbuster/common/extensions/size_extension.dart';
import 'package:blocbuster/common/screenutils/screen_utils.dart';
import 'package:blocbuster/presentation/blocs/search/search_bloc.dart';
import 'package:blocbuster/presentation/journeys/search_movie/custom_search_movie_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'logo.dart';

class MovieAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        child: Row(
          children: [
            IconButton(
                icon: SvgPicture.asset('assets/svgs/menu.svg'),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                }),
            Expanded(
              child: Logo(height: Sizes.dimen_12.w),
            ),
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: Sizes.dimen_12.h,
                ),
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(
                        searchBloc: BlocProvider.of<SearchBloc>(context),
                      ));
                })
          ],
        ),
        padding: EdgeInsets.only(
            top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
            left: Sizes.dimen_16.w,
            right: Sizes.dimen_16.w));
  }
}
