import 'package:blocbuster/common/constants/size_constants.dart';
import 'package:blocbuster/common/extensions/size_extension.dart';
import 'package:blocbuster/domain/entities/video_entity.dart';
import 'package:blocbuster/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideoScreen extends StatefulWidget {
  final WatchVideoArguments watchVideoArguments;

  const WatchVideoScreen({Key key, @required this.watchVideoArguments})
      : super(key: key);

  @override
  _WatchVideoScreenState createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  List<VideoEntity> _videos;
  YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videos = widget.watchVideoArguments.videos;
    _youtubePlayerController = YoutubePlayerController(
        initialVideoId: _videos[0].key,
        flags: YoutubePlayerFlags(autoPlay: true, mute: true));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _youtubePlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Watch trailers"),
      ),
      body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _youtubePlayerController,
          ),
          builder: (context, player) {
            return Column(
              children: [
                player,
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 1; i < _videos.length; i++)
                        Container(
                          height: 60.h,
                          padding: EdgeInsets.symmetric(
                            vertical: Sizes.dimen_8.h,
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _youtubePlayerController.load(_videos[i].key);
                                  _youtubePlayerController.play();
                                },
                                child: CachedNetworkImage(
                                  width: Sizes.dimen_200.w,
                                  imageUrl: YoutubePlayer.getThumbnail(
                                      videoId: _videos[i].key,
                                      quality: ThumbnailQuality.high),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    child: Text(
                                      _videos[i].title,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    )),
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                ))
              ],
            );
          }),
    );
  }
}
