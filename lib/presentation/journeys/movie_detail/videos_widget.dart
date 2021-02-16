import 'package:blocbuster/presentation/blocs/videos/videos_bloc.dart';
import 'package:blocbuster/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:blocbuster/presentation/journeys/watch_video/watch_video_screen.dart';
import 'package:blocbuster/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideosWidget extends StatelessWidget {
  final VideosBloc videosBloc;

  const VideosWidget({Key key, this.videosBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        cubit: videosBloc,
        builder: (context, state) {
          if (state is LoadedVideos && state.videos.iterator.moveNext()) {
            final _videos = state.videos;
            return Button(
              text: "Watch Trailers",
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WatchVideoScreen(
                          watchVideoArguments:
                              WatchVideoArguments(videos: state.videos),
                        )));
              },
            );
          } else {
            return SizedBox.shrink();
          }
        });
  }
}
