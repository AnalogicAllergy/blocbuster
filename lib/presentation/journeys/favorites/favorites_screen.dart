import 'package:blocbuster/di/get_it.dart';
import 'package:blocbuster/presentation/blocs/favorites/favorites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // remove the comment for this line

import 'favorite_movie_grid_view.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  FavoritesBloc _favoritesBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _favoritesBloc = getItInstance<FavoritesBloc>();
    _favoritesBloc.add(LoadFavoriteMovieEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _favoritesBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).favorites),
        ),
        body: BlocProvider.value(
          value: _favoritesBloc,
          child: BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state) {
              if (state is FavoriteMoviesLoaded) {
                if (state.movies.isEmpty) {
                  return Center(
                    child: Text(
                      AppLocalizations.of(context).noFavorites,
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                  );
                } else {
                  return FavoriteMovieGridView(
                    movies: state.movies,
                  );
                }
              } else if (state is FavoriteMoviesError) {
                return Text(
                  AppLocalizations.of(context).errorLoading,
                );
              }
              return SizedBox.shrink();
            },
          ),
        ));
  }
}
