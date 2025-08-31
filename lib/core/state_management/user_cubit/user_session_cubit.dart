import 'package:fayoum_club/core/databases/cache/secure_storage_helper.dart';
import 'package:fayoum_club/core/databases/cache/user_data_manager.dart';
import 'package:fayoum_club/core/services/service_locator.dart';
import 'package:fayoum_club/core/state_management/user_cubit/user_session_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSessionCubit extends Cubit<UserSessionState> {
  final SecureStorageHelper _secureStorageHelper;
  final UserDataManager _userDataManager = getIt<UserDataManager>();

  UserSessionCubit({SecureStorageHelper? secureStorageHelper})
    : _secureStorageHelper = secureStorageHelper ?? SecureStorageHelper(),
      super(const UserSessionState(isGuest: true)) {
    _initialize();
  }

  Future<void> _initialize() async {
    final cachedIsGuest = _userDataManager.getUserStatus();
    final isGuest = cachedIsGuest is bool ? cachedIsGuest : true;
    emit(UserSessionState(isGuest: isGuest));
  }

  Future<void> checkIfGuest() async {
    final token = await _secureStorageHelper.getToken();
    final isGuest = token == null || token.isEmpty;

    if (isGuest != state.isGuest) {
      emit(UserSessionState(isGuest: isGuest));
    }
    _userDataManager.saveUserStatus(isGuest: state.isGuest);
  }

  void setGuestStatus({required bool isGuest}) {
    if (isGuest != state.isGuest) {
      emit(UserSessionState(isGuest: isGuest));
      _userDataManager.saveUserStatus(isGuest: state.isGuest);
    }
  }
}
