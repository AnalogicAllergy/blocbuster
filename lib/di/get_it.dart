import 'package:blocbuster/data/core/api_client.dart';
import 'package:blocbuster/data/data_sources/movie_remote_data_source.dart';
import 'package:blocbuster/data/repositories/movie_repository_impl.dart';
import 'package:blocbuster/domain/repositories/movie_repository.dart';
import 'package:blocbuster/domain/usecases/get_cast_details.dart';
import 'package:blocbuster/domain/usecases/get_coming_soon.dart';
import 'package:blocbuster/domain/usecases/get_movie_detail.dart';
import 'package:blocbuster/domain/usecases/get_playing_now.dart';
import 'package:blocbuster/domain/usecases/get_popular.dart';
import 'package:blocbuster/domain/usecases/get_search_movies.dart';
import 'package:blocbuster/domain/usecases/get_trending.dart';
import 'package:blocbuster/domain/usecases/get_videos.dart';
import 'package:blocbuster/presentation/blocs/cast/cast_bloc.dart';
import 'package:blocbuster/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:blocbuster/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:blocbuster/presentation/blocs/movie_details/movie_details_bloc.dart';
import 'package:blocbuster/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:blocbuster/presentation/blocs/search/search_bloc.dart';
import 'package:blocbuster/presentation/blocs/videos/videos_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));
  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));
  getItInstance.registerLazySingleton<GetMovieDetail>(
      () => GetMovieDetail(getItInstance()));
  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance()));
  getItInstance.registerLazySingleton<GetCastDetails>(
      () => GetCastDetails(getItInstance()));
  getItInstance
      .registerLazySingleton<GetVideos>(() => GetVideos(getItInstance()));
  getItInstance.registerLazySingleton<GetSearchMovies>(
      () => GetSearchMovies(getItInstance()));

  getItInstance.registerFactory(() => MovieBackdropBloc());
  getItInstance.registerFactory(() => MovieCarouselBloc(
      getTrending: getItInstance(), movieBackdropBloc: getItInstance()));
  getItInstance
      .registerFactory(() => CastBloc(getCastDetails: getItInstance()));
  getItInstance.registerFactory(() => VideosBloc(getVideos: getItInstance()));

  getItInstance
      .registerFactory(() => SearchBloc(searchMovies: getItInstance()));

  getItInstance.registerFactory(() => MovieDetailsBloc(
      getMovieDetails: getItInstance(),
      castBloc: getItInstance(),
      videosBloc: getItInstance()));

  getItInstance.registerFactory(
    () => MovieTabbedBloc(
        getPopular: getItInstance(),
        getPlayingNow: getItInstance(),
        getComingSoon: getItInstance()),
  );
}
