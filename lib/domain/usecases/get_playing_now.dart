import 'package:blocbuster/domain/entities/app_error.dart';
import 'package:blocbuster/domain/entities/movie_entity.dart';
import 'package:blocbuster/domain/entities/no_params.dart';
import 'package:blocbuster/domain/repositories/movie_repository.dart';
import 'package:blocbuster/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetPlayingNow extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;

  GetPlayingNow(this.movieRepository);
  //not called directly => GetTrending getTrending = GetTrending(movieRepository) => getTrending();
  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    print("inside get trending");
    return await movieRepository.getPlayingNow();
  }
}
