import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final AppErrorType appError;

  AppError(this.appError);
  @override
  // TODO: implement props
  List<Object> get props => [appError];
}

enum AppErrorType { api, network }
