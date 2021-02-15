part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {}

class InitialMovieDetailsState extends MovieDetailsState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class MovieDetailLoading extends MovieDetailsState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class MovieDetailError extends MovieDetailsState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class MovieDetailLoaded extends MovieDetailsState {
  final MovieDetailEntity movieDetails;

  MovieDetailLoaded(this.movieDetails);

  @override
  // TODO: implement props
  List<Object> get props => [movieDetails];
}
