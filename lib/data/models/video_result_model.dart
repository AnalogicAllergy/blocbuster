// To parse this JSON data, do
//
//     final videoResultModel = videoResultModelFromMap(jsonString);

import 'dart:convert';

import 'package:blocbuster/data/models/video_model.dart';

VideoResultModel videoResultModelFromMap(String str) =>
    VideoResultModel.fromMap(json.decode(str));

String videoResultModelToMap(VideoResultModel data) =>
    json.encode(data.toMap());

class VideoResultModel {
  VideoResultModel({
    this.id,
    this.videos,
  });

  final int id;
  final List<VideoModel> videos;

  factory VideoResultModel.fromMap(Map<String, dynamic> json) =>
      VideoResultModel(
        id: json["id"],
        videos: List<VideoModel>.from(
            json["results"].map((x) => VideoModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "results": List<dynamic>.from(videos.map((x) => x.toMap())),
      };
}
