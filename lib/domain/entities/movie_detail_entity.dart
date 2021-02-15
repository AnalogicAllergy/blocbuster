import 'package:equatable/equatable.dart';

class MovieDetailEntity extends Equatable {
  final String title;
  final int id;
  final String overview;
  final String releaseDate;
  final num voteAverage;
  final String backdropPath;
  final String posterPath;

  const MovieDetailEntity({
    this.title,
    this.id,
    this.overview,
    this.releaseDate,
    this.voteAverage,
    this.backdropPath,
    this.posterPath,
  });

  @override
  // TODO: implement props
  List<Object> get props => [id];
}
