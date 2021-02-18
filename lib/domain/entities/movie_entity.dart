import 'package:blocbuster/domain/entities/movie_detail_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MovieEntity extends Equatable {
  final String posterPath;
  final int id;
  final String backdropPath;
  final String title;
  final num voteAverage;
  final String releaseDate;
  final String overview;

  MovieEntity(
      {@required this.posterPath,
      @required this.id,
      @required this.backdropPath,
      @required this.title,
      @required this.voteAverage,
      @required this.releaseDate,
      this.overview})
      : assert(id != null, 'Movie id must not be null');

  @override
  // TODO: implement props
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;

  factory MovieEntity.fromMovieDetailEntity(MovieDetailEntity movieEntity) {
    return MovieEntity(
      id: movieEntity.id,
      title: movieEntity.title,
      posterPath: movieEntity.posterPath,
      releaseDate: movieEntity.releaseDate,
      backdropPath: movieEntity.backdropPath,
      voteAverage: movieEntity.voteAverage,
    );
  }
}
