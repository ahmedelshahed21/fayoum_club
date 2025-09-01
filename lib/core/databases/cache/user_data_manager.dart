
import 'package:fayoum_club/core/databases/cache/cache_helper.dart';

class UserDataManager {
  final CacheHelper _cacheHelper;

  int? _cachedUserId;
  String? _cachedUserName;
  String? _cachedUserPhoneNumber;
  String? _cachedUserEmail;
  String? _cachedUserAvatarUrl;
  String? _cachedUserGender;
  String? _cachedUserMembership;
  // String? _cachedUserLongitude;


  UserDataManager(this._cacheHelper);

  void saveUserStatus({required bool isGuest}) {
    _cacheHelper.saveData(key: 'isGuest', value: isGuest);
  }

  bool? getUserStatus() {
    return _cacheHelper.getData(key: 'isGuest');
  }

  void saveUserId({required int userId}) {
    _cacheHelper.saveData(key: 'userId', value: userId);
    _cachedUserId = userId;
  }

  int? getUserId() {
    _cachedUserId ??= _cacheHelper.getData(key: 'userId');
    return _cachedUserId;
  }


  void saveUserName({required String name}) {
    _cacheHelper.saveData(key: 'name', value: name);
    _cachedUserName = name;
  }
  String? getUserName() {
    _cachedUserName ??= _cacheHelper.getData(key: 'name');
    return _cachedUserName;
  }

  void saveUserPhoneNumber({required String phoneNumber}) {
    _cacheHelper.saveData(key: 'phoneNumber', value: phoneNumber);
    _cachedUserPhoneNumber = phoneNumber;
  }

  String? getUserPhoneNumber() {
    _cachedUserPhoneNumber ??= _cacheHelper.getData(key: 'phoneNumber');
    return _cachedUserPhoneNumber;
  }


  void saveUserEmail({required String email}) {
    _cacheHelper.saveData(key: 'email', value: email);
    _cachedUserEmail = email;
  }

  String? getUserEmail() {
    _cachedUserEmail ??= _cacheHelper.getData(key: 'email');
    return _cachedUserEmail;
  }

  void saveUserAvatarUrl({required String avatar}) {
    _cacheHelper.saveData(key: 'avatarUrl', value: avatar);
    _cachedUserAvatarUrl = avatar;
  }

  String? getUserAvatarUrl() {
    _cachedUserAvatarUrl ??= _cacheHelper.getData(key: 'avatarUrl');
    return _cachedUserAvatarUrl;
  }


  void saveUserGender({required String gender}) {
    _cacheHelper.saveData(key: 'gender', value: gender);
    _cachedUserGender = gender;
  }

  String? getUserGender() {
    _cachedUserGender ??= _cacheHelper.getData(key: 'gender');
    return _cachedUserGender;
  }

  void saveUserMembership({required String membershipCode}) {
    _cacheHelper.saveData(key: 'membershipCode', value: membershipCode);
    _cachedUserMembership = membershipCode;
  }

  String? getUserMembership() {
    _cachedUserMembership ??= _cacheHelper.getData(key: 'membershipCode');
    return _cachedUserMembership;
  }
  //
  // void saveUserLongitude({required String longitude}) {
  //   _cacheHelper.saveData(key: 'longitude', value: longitude);
  //   _cachedUserLongitude = longitude;
  // }
  //
  // String? getUserLongitude() {
  //   _cachedUserLongitude ??= _cacheHelper.getData(key: 'longitude');
  //   return _cachedUserLongitude;
  // }



  Future<void> clearAllUserData() async {
    await _cacheHelper.removeData(key: 'isGuest');
    await _cacheHelper.removeData(key: 'userId');
    await _cacheHelper.removeData(key: 'name');
    await _cacheHelper.removeData(key: 'phoneNumber');
    await _cacheHelper.removeData(key: 'email');
    await _cacheHelper.removeData(key: 'avatarUrl');
    await _cacheHelper.removeData(key: 'gender');
    await _cacheHelper.removeData(key: 'membershipCode');
    // await _cacheHelper.removeData(key: 'longitude');

    _cachedUserId = null;
    _cachedUserName = null;
    _cachedUserPhoneNumber = null;
    _cachedUserEmail = null;
    _cachedUserAvatarUrl = null;
    _cachedUserGender = null;
    _cachedUserMembership = null;
    // _cachedUserLongitude = null;

  }
}
