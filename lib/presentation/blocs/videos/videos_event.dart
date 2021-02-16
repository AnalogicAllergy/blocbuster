part of 'videos_bloc.dart';

abstract class VideosEvent extends Equatable {}

class VideosLoadEvent extends VideosEvent {
  final int movieId;

  VideosLoadEvent({this.movieId});
  @override
  // TODO: implement props
  List<Object> get props => throw [movieId];
}
