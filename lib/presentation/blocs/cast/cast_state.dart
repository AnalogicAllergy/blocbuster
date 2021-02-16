part of 'cast_bloc.dart';

abstract class CastState extends Equatable {
  const CastState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CastInitial extends CastState {}

class CastLoaded extends CastState {
  final List<CastEntity> casts;

  CastLoaded({@required this.casts});

  @override
  // TODO: implement props
  List<Object> get props => [casts];
}

class CastError extends CastState {}
