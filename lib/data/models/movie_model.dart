import 'package:blocbuster/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int voteCount;
  final String originalLanguage;
  final String originalTitle;
  final String posterPath;
  final int id;
  final bool video;
  final double voteAverage;
  final String title;
  final String overview;
  final String releaseDate;
  final double popularity;
  final String mediaType;

  MovieModel(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.voteCount,
      this.originalLanguage,
      this.originalTitle,
      this.posterPath,
      this.id,
      this.video,
      this.voteAverage,
      this.title,
      this.overview,
      this.releaseDate,
      this.popularity,
      this.mediaType})
      : super(
          id: id,
          title: title,
          backdropPath: backdropPath,
          posterPath: posterPath,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
          overview: overview,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'].cast<int>(),
      voteCount: json['vote_count'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      posterPath: json['poster_path'],
      id: json['id'],
      video: json['video'],
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      title: json['title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      popularity: json['popularity']?.toDouble() ?? 0.0,
      mediaType: json['media_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['genre_ids'] = this.genreIds;
    data['vote_count'] = this.voteCount;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['id'] = this.id;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['title'] = this.title;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}
