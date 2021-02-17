import 'package:blocbuster/domain/entities/app_error.dart';
import 'package:blocbuster/domain/entities/movie_entity.dart';
import 'package:blocbuster/domain/entities/movie_search_params.dart';
import 'package:blocbuster/domain/repositories/movie_repository.dart';
import 'package:blocbuster/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetSearchMovies extends UseCase<List<MovieEntity>, MovieSearchParams> {
  final MovieRepository repository;

  GetSearchMovies(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(
      MovieSearchParams params) async {
    return await repository.getSearchedMovies(params.searchTerm);
  }
}
