import 'package:blocbuster/common/constants/size_constants.dart';
import 'package:blocbuster/common/extensions/size_extension.dart';
import 'package:blocbuster/data/core/api_constants.dart';
import 'package:blocbuster/domain/entities/movie_entity.dart';
import 'package:blocbuster/presentation/blocs/favorites/favorites_bloc.dart';
import 'package:blocbuster/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:blocbuster/presentation/journeys/movie_detail/movie_detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteMovieCardWidget extends StatelessWidget {
  final MovieEntity movie;

  const FavoriteMovieCardWidget({Key key, @required this.movie})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Sizes.dimen_8.w),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(Sizes.dimen_8.w)),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MovieDetailScreen(
                    movieArguments: MovieDetailArguments(movieId: movie.id),
                  )));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_8.w),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                fit: BoxFit.cover,
                width: Sizes.dimen_100.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<FavoritesBloc>(context)
                        .add(DeleteFavoriteMovieEvent(movieId: movie.id));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(Sizes.dimen_12.w),
                    child: Icon(
                      Icons.delete,
                      size: Sizes.dimen_8.h,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
