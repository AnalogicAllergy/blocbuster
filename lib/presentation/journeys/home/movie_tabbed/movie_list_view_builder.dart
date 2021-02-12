import 'package:blocbuster/common/extensions/size_extension.dart';
import 'package:blocbuster/domain/entities/movie_entity.dart';
import 'package:blocbuster/presentation/journeys/home/movie_tabbed/movie_tab_card_widget.dart';
import 'package:flutter/material.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListViewBuilder({Key key, @required this.movies})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final MovieEntity movie = movies[index];
            return MovieTabCardWidget(
                movieId: movie.id,
                title: movie.title,
                posterPath: movie.posterPath);
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 14.w,
            );
          },
          itemCount: movies.length),
    );
  }
}
