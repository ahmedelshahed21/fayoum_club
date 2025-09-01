// import 'dart:io';
//
// import 'package:darbi/features/profile/presentation/manger/update_profile_cubit/update_profile_state.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../data/model/update_profile_models/update_profile_failure_model.dart';
// import '../../../data/model/update_profile_models/update_profile_success_model.dart';
// import '../../../data/repo/update_profile_repo/update_profile_repo.dart';
//
// class UpdateProfileCubit extends Cubit<UpdateProfileState> {
//   final UpdateProfileRepo updateProfileRepo;
//   UpdateProfileCubit({required this.updateProfileRepo})
//       : super(UpdateProfileInitial());
//
//   Future<void> updateProfile(
//       {required String name,
//       required String phoneNumber,
//       required String email,
//       File? avatar}) async {
//     emit(UpdateProfileLoading());
//
//     final Either<UpdateProfileFailureModel, UpdateProfileSuccessModel> result =
//         await updateProfileRepo.updateProfile(
//             name: name, phoneNumber: phoneNumber, email: email, avatar: avatar);
//
//     result.fold((failure) => emit(UpdateProfileFailure(failure)), (success) {
//       emit(UpdateProfileSuccess(success: success));
//     });
//   }
// }
