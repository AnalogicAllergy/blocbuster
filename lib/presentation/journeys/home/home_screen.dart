import 'package:blocbuster/di/get_it.dart';
import 'package:blocbuster/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:blocbuster/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:blocbuster/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:blocbuster/presentation/blocs/search/search_bloc.dart';
import 'package:blocbuster/presentation/journeys/drawer/navigation_drawer.dart';
import 'package:blocbuster/presentation/journeys/home/movie_tabbed/movie_tabbed_widget.dart';
import 'package:blocbuster/presentation/themes/app_color.dart';
import 'package:blocbuster/presentation/themes/theme_text.dart';
import 'package:blocbuster/presentation/widgets/app_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // remove the comment for this line

import 'movie_carousel/movie_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCarouselBloc movieCarouselBloc;
  MovieBackdropBloc movieBackdropBloc;
  MovieTabbedBloc movieTabbedBloc;
  SearchBloc searchBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
    movieTabbedBloc = getItInstance<MovieTabbedBloc>();
    searchBloc = getItInstance<SearchBloc>();
    movieCarouselBloc.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    movieCarouselBloc?.close();
    movieBackdropBloc?.close();
    searchBloc?.close();
    movieTabbedBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => movieCarouselBloc),
        BlocProvider(create: (context) => movieBackdropBloc),
        BlocProvider(create: (context) => movieTabbedBloc),
        BlocProvider(create: (context) => searchBloc),
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales, // Add this line
        theme: ThemeData(
            primaryColor: AppColor.vulcan,
            scaffoldBackgroundColor: AppColor.vulcan,
            accentColor: AppColor.royalBlue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: ThemeText.getTextTheme(),
            appBarTheme: const AppBarTheme(elevation: 0)),
        home: Scaffold(
            drawer: const NavigationDrawer(),
            body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
              cubit: movieCarouselBloc,
              builder: (context, state) {
                if (state is MovieCarouselLoaded) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      FractionallySizedBox(
                        alignment: Alignment.topCenter,
                        heightFactor: 0.6,
                        child: MovieCarouselWidget(
                            movies: state.movies,
                            defaultIndex: state.defaultIndex),
                      ),
                      FractionallySizedBox(
                          alignment: Alignment.bottomCenter,
                          heightFactor: 0.4,
                          child: MovieTabbedWidget())
                    ],
                  );
                } else if (state is MovieCarouselError) {
                  return AppErrorWidget(
                    onPressed: () => movieCarouselBloc.add(CarouselLoadEvent()),
                    errorType: state.appErrorType,
                  );
                }
                return SizedBox.shrink();
              },
            )),
      ),
    );
  }
}
