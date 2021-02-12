import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocbuster/domain/entities/app_error.dart';
import 'package:blocbuster/domain/entities/movie_entity.dart';
import 'package:blocbuster/domain/entities/no_params.dart';
import 'package:blocbuster/domain/usecases/get_coming_soon.dart';
import 'package:blocbuster/domain/usecases/get_playing_now.dart';
import 'package:blocbuster/domain/usecases/get_popular.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  MovieTabbedBloc(
      {MovieTabbedState initialState,
      @required this.getPopular,
      @required this.getPlayingNow,
      @required this.getComingSoon})
      : super(InitialMovieTabbedState());

  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;

  @override
  Stream<MovieTabbedState> mapEventToState(MovieTabbedEvent event) async* {
    if (event is MovieTabChangedEvent) {
      Either<AppError, List<MovieEntity>> moviesEither;
      switch (event.currentTabIndex) {
        case 0:
          moviesEither = await getPopular(NoParams());
          break;
        case 1:
          moviesEither = await getPlayingNow(NoParams());
          break;
        case 2:
          moviesEither = await getComingSoon(NoParams());
          break;
        default:
      }
      yield moviesEither.fold(
          (l) => MovieTabLoadError(currentTabIndex: event.currentTabIndex),
          (movies) => MovieTabChanged(
              currentTabIndex: event.currentTabIndex, movies: movies));
    }
  }
}
