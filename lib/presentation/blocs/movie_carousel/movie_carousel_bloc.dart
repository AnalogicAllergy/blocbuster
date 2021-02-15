import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocbuster/domain/entities/app_error.dart';
import 'package:blocbuster/domain/entities/movie_entity.dart';
import 'package:blocbuster/domain/entities/no_params.dart';
import 'package:blocbuster/domain/usecases/get_trending.dart';
import 'package:blocbuster/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;

  MovieCarouselBloc(
      {@required this.movieBackdropBloc, @required this.getTrending})
      : assert(getTrending != null),
        super(MovieCarouselInitial());

  @override
  Stream<MovieCarouselState> mapEventToState(
    MovieCarouselEvent event,
  ) async* {
    if (event is CarouselLoadEvent) {
      final moviesEither = await getTrending(NoParams());
      yield moviesEither
          .fold((l) => MovieCarouselError(appErrorType: l.appError), (movies) {
        movieBackdropBloc
            .add(MovieBackdropChangedEvent(movies[event.defaultIndex]));
        return MovieCarouselLoaded(
            movies: movies, defaultIndex: event.defaultIndex);
      });
    }
  }
}
