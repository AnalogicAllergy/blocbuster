import 'package:blocbuster/common/constants/size_constants.dart';
import 'package:blocbuster/common/extensions/size_extension.dart';
import 'package:blocbuster/di/get_it.dart';
import 'package:blocbuster/presentation/blocs/movie_details/movie_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'big_poster.dart';
import 'movie_detail_arguments.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieArguments;

  const MovieDetailScreen({Key key, @required this.movieArguments})
      : assert(movieArguments != null, 'arguments can not be null'),
        super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  MovieDetailsBloc _movieDetailsBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _movieDetailsBloc = getItInstance<MovieDetailsBloc>();
    _movieDetailsBloc
        .add(MovieDetailLoadEvent(movieId: widget.movieArguments.movieId));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _movieDetailsBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MovieDetailsBloc>.value(
        value: _movieDetailsBloc,
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
            builder: (context, state) {
          if (state is MovieDetailLoaded) {
            final movieDetail = state.movieDetails;

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BigPoster(
                  movie: movieDetail,
                ),
                Padding(
                    child: Text(movieDetail.overview,
                        style: Theme.of(context).textTheme.bodyText2),
                    padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w))
              ],
            );
          } else if (state is MovieDetailError) {
            return Container(
              color: Colors.red,
            );
          }
          return SizedBox.shrink();
        }),
      ),
    );
  }
}
