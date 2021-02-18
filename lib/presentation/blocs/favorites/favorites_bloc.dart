import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocbuster/domain/entities/app_error.dart';
import 'package:blocbuster/domain/entities/movie_entity.dart';
import 'package:blocbuster/domain/entities/movie_params.dart';
import 'package:blocbuster/domain/entities/no_params.dart';
import 'package:blocbuster/domain/usecases/check_if_favourite_movie.dart';
import 'package:blocbuster/domain/usecases/delete_favorite_movie.dart';
import 'package:blocbuster/domain/usecases/get_favorites_movies.dart';
import 'package:blocbuster/domain/usecases/save_movie.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc(
      {@required this.saveMovie,
      @required this.getFavoriteMovies,
      @required this.deleteFavoriteMovie,
      @required this.checkIfFavouriteMovie})
      : super(InitialFavoritesState());
  final SaveMovie saveMovie;
  final GetFavoriteMovies getFavoriteMovies;
  final DeleteFavoriteMovie deleteFavoriteMovie;
  final CheckIfFavouriteMovie checkIfFavouriteMovie;

  @override
  Stream<FavoritesState> mapEventToState(
    FavoritesEvent event,
  ) async* {
    if (event is ToggleFavoriteMovieEvent) {
      if (event.isFavorite) {
        await deleteFavoriteMovie(MovieParams(id: event.movieEntity.id));
      } else {
        await saveMovie(event.movieEntity);
      }
      final response =
          await checkIfFavouriteMovie(MovieParams(id: event.movieEntity.id));
      yield response.fold((l) => FavoriteMoviesError(),
          (isFavorite) => IsFavoriteMovie(isMovieFavorite: isFavorite));
    } else if (event is LoadFavoriteMovieEvent) {
      yield* _fetchLoadFavoriteMovies();
    } else if (event is DeleteFavoriteMovieEvent) {
      await deleteFavoriteMovie(MovieParams(id: event.movieId));
      yield* _fetchLoadFavoriteMovies();
    } else if (event is CheckIfFavouriteMovieEvent) {
      final response =
          await checkIfFavouriteMovie(MovieParams(id: event.movieId));
      yield response.fold((l) => FavoriteMoviesError(),
          (isFavorite) => IsFavoriteMovie(isMovieFavorite: isFavorite));
    }
  }

  Stream<FavoritesState> _fetchLoadFavoriteMovies() async* {
    final Either<AppError, List<MovieEntity>> eitherResponse =
        await getFavoriteMovies(NoParams());
    yield eitherResponse.fold((l) => FavoriteMoviesError(),
        (movies) => FavoriteMoviesLoaded(movies: movies));
  }
}
