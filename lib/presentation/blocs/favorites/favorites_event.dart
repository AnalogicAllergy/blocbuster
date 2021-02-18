part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {}

class LoadFavoriteMovieEvent extends FavoritesEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DeleteFavoriteMovieEvent extends FavoritesEvent {
  final int movieId;

  DeleteFavoriteMovieEvent({this.movieId});

  @override
  // TODO: implement props
  List<Object> get props => [movieId];
}

class ToggleFavoriteMovieEvent extends FavoritesEvent {
  final MovieEntity movieEntity;
  final bool isFavorite;

  ToggleFavoriteMovieEvent({this.movieEntity, this.isFavorite});

  @override
  // TODO: implement props
  List<Object> get props => [movieEntity, isFavorite];
}

class CheckIfFavouriteMovieEvent extends FavoritesEvent {
  final int movieId;

  CheckIfFavouriteMovieEvent({this.movieId});

  @override
  // TODO: implement props
  List<Object> get props => [movieId];
}
