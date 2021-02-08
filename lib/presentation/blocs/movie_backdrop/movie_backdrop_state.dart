part of 'movie_backdrop_bloc.dart';

@immutable
abstract class MovieBackdropState extends Equatable {}

class MovieBackdropInitial extends MovieBackdropState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class MovieBackdropChanged extends MovieBackdropState {
  final MovieEntity movie;

  MovieBackdropChanged(this.movie);

  @override
  // TODO: implement props
  List<Object> get props => [movie];
}
