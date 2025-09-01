import 'package:equatable/equatable.dart';
import 'package:fayoum_club/core/data/models/auth_failure_model.dart';
import 'package:fayoum_club/features/general/data/models/contact_us_success_model.dart';


abstract class ContactUsState extends Equatable {
  const ContactUsState();

  @override
  List<Object?> get props => [];
}

class ContactUsInitialState extends ContactUsState {}

class ContactUsLoadingState extends ContactUsState {}

class ContactUsSuccessState extends ContactUsState {
  final ContactUSSuccessModel contactUs;

  const ContactUsSuccessState({required this.contactUs});

  @override
  List<Object?> get props => [contactUs];
}

class ContactUsFailureState extends ContactUsState {
  final AuthFailureModel failure;

  const ContactUsFailureState(this.failure);

  @override
  List<Object?> get props => [failure];
}
