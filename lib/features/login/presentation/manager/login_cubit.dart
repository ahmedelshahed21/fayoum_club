import 'package:fayoum_club/core/data/models/auth_success_model.dart';
import 'package:fayoum_club/core/data/models/auth_failure_model.dart';
import 'package:fayoum_club/core/data/models/auth_success_model.dart';
import 'package:fayoum_club/features/login/data/repos/login_repo.dart';
import 'package:fayoum_club/features/login/presentation/manager/login_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit({required this.loginRepo}) : super(LoginInitialState());

  Future<void> login({
    required String phoneNumber,
    required String password,
  }) async {
    emit(LoginLoadingState());

    final Either<AuthFailureModel, AuthSuccessModel> result = await loginRepo
        .login(phoneNumber: phoneNumber, password: password);

    result.fold((failure) => emit(LoginFailureState(failure)), (login) {
      emit(LoginSuccessState(login: login));
    });
  }
}
