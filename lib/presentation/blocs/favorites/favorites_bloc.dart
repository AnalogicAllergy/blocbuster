import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favorites_event.dart';

part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  @override
  FavoritesState get initialState => InitialFavoritesState();

  @override
  Stream<FavoritesState> mapEventToState(FavoritesEvent event) async* {
    // TODO: Add your event logic
  }
}
