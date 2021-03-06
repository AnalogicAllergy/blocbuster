import 'package:blocbuster/common/constants/size_constants.dart';
import 'package:blocbuster/common/extensions/num_extension.dart';
import 'package:blocbuster/common/extensions/size_extension.dart';
import 'package:blocbuster/common/screenutils/screen_utils.dart';
import 'package:blocbuster/data/core/api_constants.dart';
import 'package:blocbuster/domain/entities/movie_detail_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../themes/theme_text.dart';
import 'movie_detail_app_bar.dart';

class BigPoster extends StatelessWidget {
  final MovieDetailEntity movie;

  const BigPoster({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Theme.of(context).primaryColor.withOpacity(0.3),
                Theme.of(context).primaryColor,
              ])),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
            width: ScreenUtil.screenWidth,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ListTile(
            title: Text(
              movie.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              movie.releaseDate,
              style: Theme.of(context).textTheme.greySubtitle1,
            ),
            trailing: Text(
              movie.voteAverage.convertToPercentage(),
              style: Theme.of(context).textTheme.violetHeadline6,
            ),
          ),
        ),
        Positioned(
          top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
          left: Sizes.dimen_16.w,
          right: Sizes.dimen_16.w,
          child: MovieDetailAppBar(
            movieEntity: movie,
          ),
        )
      ],
    );
  }
}
