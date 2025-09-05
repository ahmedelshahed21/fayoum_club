import 'package:fayoum_club/core/data/models/validation_model.dart';
import 'package:fayoum_club/core/data/models/auth_success_model.dart';
import 'package:equatable/equatable.dart';


abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final AuthSuccessModel login;

  const LoginSuccessState({required this.login});

  @override
  List<Object?> get props => [login];
}

class LoginFailureState extends LoginState {
  final ValidationModel failedModel;

  const LoginFailureState(this.failedModel);

  @override
  List<Object?> get props => [failedModel];
}
