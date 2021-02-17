part of 'search_bloc.dart';

abstract class SearchState extends Equatable {}

class InitialSearchState extends SearchState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SearchMovieLoaded extends SearchState {
  final List<MovieEntity> movies;

  SearchMovieLoaded({this.movies});

  @override
  // TODO: implement props
  List<Object> get props => [movies];
}

class SearchMovieLoading extends SearchState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SearchMovieError extends SearchState {
  final AppErrorType errorType;

  SearchMovieError({this.errorType});

  @override
  // TODO: implement props
  List<Object> get props => [errorType];
}
