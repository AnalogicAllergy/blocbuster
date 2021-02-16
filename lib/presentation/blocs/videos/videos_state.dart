part of 'videos_bloc.dart';

abstract class VideosState extends Equatable {
  const VideosState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class InitialVideosState extends VideosState {}

class NoVideos extends VideosState {}

class LoadedVideos extends VideosState {
  final List<VideoEntity> videos;

  LoadedVideos({this.videos});
  @override
  // TODO: implement props
  List<Object> get props => [videos];
}
