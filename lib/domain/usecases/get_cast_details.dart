import 'package:blocbuster/domain/entities/app_error.dart';
import 'package:blocbuster/domain/entities/cast_entity.dart';
import 'package:blocbuster/domain/entities/movie_params.dart';
import 'package:blocbuster/domain/repositories/movie_repository.dart';
import 'package:blocbuster/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetCastDetails extends UseCase<List<CastEntity>, MovieParams> {
  final MovieRepository repository;

  GetCastDetails(this.repository);

  @override
  Future<Either<AppError, List<CastEntity>>> call(MovieParams params) async {
    return await repository.getCastCrew(params.id);
  }
}
