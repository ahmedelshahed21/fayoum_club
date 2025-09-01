import 'package:fayoum_club/features/profile/data/model/change_password_models/change_password_request_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/change_password_repo/change_password_repo.dart';
import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordRepo changePasswordRepo;

  ChangePasswordCubit({required this.changePasswordRepo})
    : super(const ChangePasswordInitial());

  Future<void> changePassword({required ChangePasswordRequestModel data}) async {
    emit(const ChangePasswordLoading());

    final result = await changePasswordRepo.changePassword(data: data);

    result.fold(
      (failure) => emit(ChangePasswordFailure(failure)),
      (success) => emit(ChangePasswordSuccess(success)),
    );
  }
}
