import 'package:fayoum_club/core/data/models/auth_failure_model.dart';
import 'package:fayoum_club/core/data/models/auth_success_model.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final AuthSuccessModel register;

  const RegisterSuccessState({required this.register});

  @override
  List<Object?> get props => [register];
}

class RegisterFailureState extends RegisterState {
  final AuthFailureModel failedModel;

  const RegisterFailureState(this.failedModel);

  @override
  List<Object?> get props => [failedModel];
}
