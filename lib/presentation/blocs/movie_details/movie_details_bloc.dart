import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocbuster/domain/entities/app_error.dart';
import 'package:blocbuster/domain/entities/movie_detail_entity.dart';
import 'package:blocbuster/domain/entities/movie_params.dart';
import 'package:blocbuster/domain/usecases/get_movie_detail.dart';
import 'package:blocbuster/presentation/blocs/cast/cast_bloc.dart';
import 'package:blocbuster/presentation/blocs/videos/videos_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(
      {@required this.videosBloc,
      @required this.castBloc,
      @required this.getMovieDetails})
      : super(InitialMovieDetailsState());

  final GetMovieDetail getMovieDetails;
  final CastBloc castBloc;
  final VideosBloc videosBloc;

  @override
  Stream<MovieDetailsState> mapEventToState(MovieDetailsEvent event) async* {
    if (event is MovieDetailLoadEvent) {
      final Either<AppError, MovieDetailEntity> eitherResponse =
          await getMovieDetails(MovieParams(id: event.movieId));
      yield eitherResponse.fold(
          (l) => MovieDetailError(), (movie) => MovieDetailLoaded(movie));
      castBloc.add(LoadCastEvent(movieId: event.movieId));
      videosBloc.add(VideosLoadEvent(movieId: event.movieId));
    }
  }
}
