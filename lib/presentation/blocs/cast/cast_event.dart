part of 'cast_bloc.dart';

abstract class CastEvent extends Equatable {
  const CastEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadCastEvent extends CastEvent {
  final int movieId;

  LoadCastEvent({this.movieId});

  @override
  // TODO: implement props
  List<Object> get props => [movieId];
}
