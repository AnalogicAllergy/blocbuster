import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocbuster/domain/entities/app_error.dart';
import 'package:blocbuster/domain/entities/movie_params.dart';
import 'package:blocbuster/domain/entities/video_entity.dart';
import 'package:blocbuster/domain/usecases/get_videos.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'videos_event.dart';
part 'videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  VideosBloc({@required this.getVideos}) : super(InitialVideosState());

  final GetVideos getVideos;

  @override
  Stream<VideosState> mapEventToState(
    VideosEvent event,
  ) async* {
    if (event is VideosLoadEvent) {
      final Either<AppError, List<VideoEntity>> eitherResponse =
          await getVideos(MovieParams(id: event.movieId));
      yield eitherResponse.fold(
          (l) => NoVideos(), (videos) => LoadedVideos(videos: videos));
    }
  }
}
