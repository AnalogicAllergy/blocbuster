import 'package:blocbuster/common/constants/size_constants.dart';
import 'package:blocbuster/common/extensions/size_extension.dart';
import 'package:blocbuster/presentation/blocs/search/search_bloc.dart';
import 'package:blocbuster/presentation/journeys/search_movie/search_movie_card.dart';
import 'package:blocbuster/presentation/themes/app_color.dart';
import 'package:blocbuster/presentation/widgets/app_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../themes/theme_text.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchBloc searchBloc;

  CustomSearchDelegate({this.searchBloc});

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
      hintStyle: Theme.of(context).textTheme.greySubtitle1,
    ));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          color: query.isEmpty ? AppColor.vulcan : Colors.white,
          onPressed: query.isEmpty
              ? null
              : () {
                  query = '';
                })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: Sizes.dimen_8.h,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchBloc.add(SearchTermChangedEvent(searchTerm: query));
    return BlocBuilder(
        cubit: searchBloc,
        builder: (context, state) {
          if (state is SearchMovieLoaded) {
            final movies = state.movies;
            if (movies.isEmpty) {
              return Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_64.w),
                child: Text(
                  "Could not retrieve any movies with given search term",
                  textAlign: TextAlign.center,
                ),
              ));
            }
            return ListView.builder(
                itemCount: movies.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return SearchMovieCard(movie: movies[index]);
                });
          } else if (state is SearchMovieError) {
            return AppErrorWidget(
                errorType: state.errorType,
                onPressed: () {
                  searchBloc.add(SearchTermChangedEvent(searchTerm: query));
                });
          } else {
            return SizedBox.shrink();
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}
