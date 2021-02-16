import 'package:blocbuster/common/constants/size_constants.dart';
import 'package:blocbuster/common/extensions/size_extension.dart';
import 'package:blocbuster/di/get_it.dart';
import 'package:blocbuster/presentation/blocs/cast/cast_bloc.dart';
import 'package:blocbuster/presentation/blocs/movie_details/movie_details_bloc.dart';
import 'package:blocbuster/presentation/blocs/videos/videos_bloc.dart';
import 'package:blocbuster/presentation/journeys/movie_detail/videos_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'big_poster.dart';
import 'cast_widget.dart';
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
  CastBloc _castBloc;
  VideosBloc _videosBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _movieDetailsBloc = getItInstance<MovieDetailsBloc>();
    _castBloc = _movieDetailsBloc.castBloc;
    _videosBloc = _movieDetailsBloc.videosBloc;

    _movieDetailsBloc
        .add(MovieDetailLoadEvent(movieId: widget.movieArguments.movieId));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _movieDetailsBloc?.close();
    _castBloc?.close();
    _videosBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _movieDetailsBloc),
          BlocProvider.value(value: _castBloc),
          BlocProvider.value(value: _videosBloc)
        ],
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
            builder: (context, state) {
          if (state is MovieDetailLoaded) {
            final movieDetail = state.movieDetails;

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BigPoster(
                    movie: movieDetail,
                  ),
                  Padding(
                    child: Text(movieDetail.overview,
                        style: Theme.of(context).textTheme.bodyText2),
                    padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_16.w,
                        vertical: Sizes.dimen_8.h),
                    child: Text(
                      "Cast",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  CastWidget(),
                  VideosWidget(videosBloc: _videosBloc),

                  //start of cast section,
                ],
              ),
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
