import 'package:blocbuster/domain/entities/movie_entity.dart';
import 'package:blocbuster/presentation/widgets/movie_app_bar.dart';
import 'package:blocbuster/presentation/widgets/separator.dart';
import 'package:flutter/cupertino.dart';

import 'movie_backdrop_widget.dart';
import 'movie_data_widget.dart';
import 'movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget(
      {Key key, @required this.movies, @required this.defaultIndex})
      : assert(defaultIndex >= 0, 'defaultIndex cannot be negative'),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackdropWidget(),
        Column(
          children: [
            MovieAppBar(),
            MoviePageView(movies: movies, initialPage: defaultIndex),
            MovieDataWidget(),
            Separator(),
          ],
        ),
      ],
    );
  }
}
