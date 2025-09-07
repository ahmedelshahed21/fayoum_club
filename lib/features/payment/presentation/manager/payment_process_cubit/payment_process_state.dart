import 'package:equatable/equatable.dart';
import 'package:fayoum_club/core/data/models/success_model.dart';
import 'package:fayoum_club/core/data/models/validation_model.dart';

abstract class PaymentProcessState extends Equatable {
  const PaymentProcessState();

  @override
  List<Object?> get props => [];
}

class PaymentProcessInitial extends PaymentProcessState {}

class PaymentProcessLoading extends PaymentProcessState {
  const PaymentProcessLoading();

  @override
  List<Object?> get props => [];
}

class PaymentProcessSuccess extends PaymentProcessState {
  final BasicModel model;

  const PaymentProcessSuccess(this.model);

  @override
  List<Object?> get props => [model];
}

class PaymentProcessFailure extends PaymentProcessState {
  final ValidationModel failure;

  const PaymentProcessFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
