import 'package:blocbuster/data/data_sources/movie_remote_data_source.dart';
import 'package:blocbuster/domain/entities/no_params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'data/core/api_client.dart';
import 'data/repositories/movie_repository_impl.dart';
import 'domain/entities/app_error.dart';
import 'domain/entities/movie_entity.dart';
import 'domain/repositories/movie_repository.dart';
import 'domain/usecases/get_trending.dart';

void main() async {
  // called
  Client _client = Client();
  ApiClient _apiClient = ApiClient(_client);
  MovieRemoteDataSource dataSource = new MovieRemoteDataSourceImpl(_apiClient);
  MovieRepository movieRepository = new MovieRepositoryImpl(dataSource);
  GetTrending getTrending = GetTrending(movieRepository);
  final Either<AppError, List<MovieEntity>> eitherResponse =
      await getTrending(NoParams());
  eitherResponse.fold((l) {
    print('error');
    print(l);
  }, (r) {
    print("success");
    print(r);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(),
    );
  }
}
