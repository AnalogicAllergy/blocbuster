import 'package:blocbuster/domain/entities/app_error.dart';
import 'package:blocbuster/domain/entities/movie_params.dart';
import 'package:blocbuster/domain/entities/video_entity.dart';
import 'package:blocbuster/domain/repositories/movie_repository.dart';
import 'package:blocbuster/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetVideos extends UseCase<List<VideoEntity>, MovieParams> {
  final MovieRepository repository;

  GetVideos(this.repository);
  @override
  Future<Either<AppError, List<VideoEntity>>> call(MovieParams params) async {
    return await repository.getVideos(params.id);
  }
}
