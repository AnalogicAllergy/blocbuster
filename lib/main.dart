import 'package:blocbuster/domain/entities/no_params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';

//getIt
import 'di/get_it.dart' as getIt;
import 'domain/entities/app_error.dart';
import 'domain/entities/movie_entity.dart';
import 'domain/usecases/get_trending.dart';

Future<void> main() async {
  unawaited(getIt.init());

  // ANTES
  /**
   * Client _client = Client();
      ApiClient _apiClient = ApiClient(_client);
      MovieRemoteDataSource dataSource = new MovieRemoteDataSourceImpl(_apiClient);
      MovieRepository movieRepository = new MovieRepositoryImpl(dataSource);
   * */
  //DEPOIS - TODAS as dependencias de instanciacao estao satisfeitas com getIt
  GetTrending getTrending = getIt.getItInstance<GetTrending>();

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
