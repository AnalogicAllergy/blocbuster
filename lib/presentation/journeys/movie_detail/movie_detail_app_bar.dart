import 'package:blocbuster/common/constants/size_constants.dart';
import 'package:blocbuster/common/extensions/size_extension.dart';
import 'package:blocbuster/domain/entities/movie_detail_entity.dart';
import 'package:blocbuster/domain/entities/movie_entity.dart';
import 'package:blocbuster/presentation/blocs/favorites/favorites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetailEntity movieEntity;

  const MovieDetailAppBar({Key key, @required this.movieEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back_ios,
                color: Colors.white, size: Sizes.dimen_8.h)),
        BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            if (state is IsFavoriteMovie) {
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<FavoritesBloc>(context).add(
                      ToggleFavoriteMovieEvent(
                          movieEntity:
                              MovieEntity.fromMovieDetailEntity(movieEntity),
                          isFavorite: state.isMovieFavorite));
                },
                child: Icon(
                    state.isMovieFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.white,
                    size: Sizes.dimen_8.h),
              );
            } else {
              return Icon(Icons.favorite_border,
                  color: Colors.white, size: Sizes.dimen_8.h);
            }
          },
        ),
      ],
    );
  }
}
