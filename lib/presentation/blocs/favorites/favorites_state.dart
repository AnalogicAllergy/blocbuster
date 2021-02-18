part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class InitialFavoritesState extends FavoritesState {}

class FavoriteMoviesLoaded extends FavoritesState {
  final List<MovieEntity> movies;

  FavoriteMoviesLoaded({this.movies});

  @override
  // TODO: implement props
  List<Object> get props => [movies];
}

class FavoriteMoviesError extends FavoritesState {}

class IsFavoriteMovie extends FavoritesState {
  final bool isMovieFavorite;

  IsFavoriteMovie({this.isMovieFavorite});

  @override
  // TODO: implement props
  List<Object> get props => [isMovieFavorite];
}
