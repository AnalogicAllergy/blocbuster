part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();

  @override
  List<Object> get props => [];
}

class MovieCarouselInitial extends MovieCarouselState {}

class MovieCarouselError extends MovieCarouselState {
  final AppErrorType appErrorType;

  MovieCarouselError({this.appErrorType});

  @override
  // TODO: implement props
  List<Object> get props => [appErrorType];
}

class MovieCarouselLoaded extends MovieCarouselState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  MovieCarouselLoaded({this.movies, this.defaultIndex})
      : assert(defaultIndex >= 0, 'defaultIndex cannot be negative');
  @override
  // TODO: implement props
  List<Object> get props => [movies, defaultIndex];
}
