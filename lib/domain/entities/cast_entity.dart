import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CastEntity extends Equatable {
  final String creditId;
  final String name;
  final String posterPath;
  final String character;

  const CastEntity(
      {@required this.creditId,
      @required this.name,
      @required this.posterPath,
      @required this.character});

  @override
  // TODO: implement props
  List<Object> get props => [creditId];

  @override
  // TODO: implement stringify
  bool get stringify => true;
}
