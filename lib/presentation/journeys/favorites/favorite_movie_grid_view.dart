import 'package:blocbuster/common/constants/size_constants.dart';
import 'package:blocbuster/common/extensions/size_extension.dart';

import 'package:blocbuster/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';

import 'favorite_movie_card_widget.dart';

class FavoriteMovieGridView extends StatelessWidget {
  final List<MovieEntity> movies;

  const FavoriteMovieGridView({Key key, @required this.movies})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dimen_8.w,
      ),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: movies.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: Sizes.dimen_16.w),
          itemBuilder: (context, index) {
            return FavoriteMovieCardWidget(movie: movies[index]);
          }),
    );
  }
}
