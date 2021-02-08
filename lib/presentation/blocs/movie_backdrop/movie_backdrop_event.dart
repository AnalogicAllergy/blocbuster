part of 'movie_backdrop_bloc.dart';

@immutable
abstract class MovieBackdropEvent extends Equatable {}

class MovieBackdropChangedEvent extends MovieBackdropEvent {
  final MovieEntity currentMovie;

  MovieBackdropChangedEvent(this.currentMovie);
  @override
  // TODO: implement props
  List<Object> get props => [currentMovie];
}
