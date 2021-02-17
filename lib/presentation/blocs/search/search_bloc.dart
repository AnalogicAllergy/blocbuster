import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocbuster/domain/entities/app_error.dart';
import 'package:blocbuster/domain/entities/movie_entity.dart';
import 'package:blocbuster/domain/entities/movie_search_params.dart';
import 'package:blocbuster/domain/usecases/get_search_movies.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({this.searchMovies}) : super(InitialSearchState());

  final GetSearchMovies searchMovies;

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchTermChangedEvent) {
      if (event.searchTerm.length > 2) {
        yield SearchMovieLoading();
        final Either<AppError, List<MovieEntity>> eitherResponse =
            await searchMovies(MovieSearchParams(searchTerm: event.searchTerm));
        yield eitherResponse.fold(
            (l) => SearchMovieError(errorType: l.appError),
            (movies) => SearchMovieLoaded(movies: movies));
      }
    }
  }
}
