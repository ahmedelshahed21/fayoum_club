import 'package:dartz/dartz.dart';
import 'package:fayoum_club/core/data/models/validation_model.dart';
import 'package:fayoum_club/features/more/data/models/contact_us_request_model.dart';
import 'package:fayoum_club/features/more/data/models/contact_us_success_model.dart';
import 'package:fayoum_club/features/more/data/repos/contact_us_repo/contact_us_repo.dart';
import 'package:fayoum_club/features/more/presentation/manager/contact_us_cubit/contact_us_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  final ContactUsRepo contactUsRepo;

  ContactUsCubit({required this.contactUsRepo})
    : super(ContactUsInitialState());

  Future<void> contactUs({required ContactUsRequestModel contactData}) async {
    emit(ContactUsLoadingState());

    final Either<ValidationModel, ContactUSSuccessModel> result =
        await contactUsRepo.contactUs(contactData: contactData);

    result.fold((failure) => emit(ContactUsFailureState(failure)), (contactUs) {
      emit(ContactUsSuccessState(contactUs: contactUs));
    });
  }
}
