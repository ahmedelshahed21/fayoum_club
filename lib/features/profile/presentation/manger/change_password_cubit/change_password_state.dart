import 'package:flutter/cupertino.dart';
import '../../../../../../core/data/models/auth_failure_model.dart';
import '../../../../../../core/data/models/basic_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


@immutable
abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();

  @override
  List<Object?> get props => [];
}

class ChangePasswordInitial extends ChangePasswordState {
  const ChangePasswordInitial();
}

class ChangePasswordLoading extends ChangePasswordState {
  const ChangePasswordLoading();
}

class ChangePasswordSuccess extends ChangePasswordState {
  final BasicModel success;

  const ChangePasswordSuccess(this.success);

  @override
  List<Object?> get props => [success];
}

class ChangePasswordFailure extends ChangePasswordState {
  final AuthFailureModel error;

  const ChangePasswordFailure(this.error);

  @override
  List<Object?> get props => [error];
}
