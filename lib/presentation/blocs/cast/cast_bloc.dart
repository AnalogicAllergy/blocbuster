import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocbuster/domain/entities/app_error.dart';
import 'package:blocbuster/domain/entities/cast_entity.dart';
import 'package:blocbuster/domain/entities/movie_params.dart';
import 'package:blocbuster/domain/usecases/get_cast_details.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  CastBloc({this.getCastDetails}) : super(CastInitial());
  final GetCastDetails getCastDetails;

  @override
  Stream<CastState> mapEventToState(
    CastEvent event,
  ) async* {
    if (event is LoadCastEvent) {
      Either<AppError, List<CastEntity>> eitherResponse =
          await getCastDetails(MovieParams(id: event.movieId));
      yield eitherResponse.fold(
          (l) => CastError(), (casts) => CastLoaded(casts: casts));
    }
  }
}
