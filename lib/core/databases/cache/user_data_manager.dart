import 'package:fayoum_club/core/databases/cache/cache_helper.dart'
    show CacheHelper;

class UserDataManager {
  final CacheHelper _cacheHelper;

  String? _cachedUserEmail;
  String? _cachedUserName;
  String? _cachedUserPhoneNumber;
  String? _cachedUserLogoUrl;
  String? _cachedUserAddress;
  String? _cachedUserLatitude;
  String? _cachedUserLongitude;
  int? _cachedCartId;

  UserDataManager(this._cacheHelper);

  void saveUserName({required String name}) {
    _cacheHelper.saveData(key: 'name', value: name);
    _cachedUserName = name;
  }

  String? getUserName() {
    _cachedUserName ??= _cacheHelper.getData(key: 'name');
    return _cachedUserName;
  }

  void saveUserEmail({required String email}) {
    _cacheHelper.saveData(key: 'email', value: email);
    _cachedUserEmail = email;
  }

  String? getUserEmail() {
    _cachedUserEmail ??= _cacheHelper.getData(key: 'email');
    return _cachedUserEmail;
  }

  void saveUserPhoneNumber({required String phoneNumber}) {
    _cacheHelper.saveData(key: 'phoneNumber', value: phoneNumber);
    _cachedUserPhoneNumber = phoneNumber;
  }

  String? getUserPhoneNumber() {
    _cachedUserPhoneNumber ??= _cacheHelper.getData(key: 'phoneNumber');
    return _cachedUserPhoneNumber;
  }

  void saveUserAvatarUrl({required String avatar}) {
    _cacheHelper.saveData(key: 'avatarUrl', value: avatar);
    _cachedUserLogoUrl = avatar;
  }

  String? getUserAvatarUrl() {
    _cachedUserLogoUrl ??= _cacheHelper.getData(key: 'avatarUrl');
    return _cachedUserLogoUrl;
  }

  void saveUserStatus({required bool isGuest}) {
    _cacheHelper.saveData(key: 'isGuest', value: isGuest);
  }

  bool? getUserStatus() {
    return _cacheHelper.getData(key: 'isGuest');
  }

  void saveUserAddress({required String address}) {
    _cacheHelper.saveData(key: 'address', value: address);
    _cachedUserAddress = address;
  }

  String? getUserAddress() {
    _cachedUserAddress ??= _cacheHelper.getData(key: 'address');
    return _cachedUserAddress;
  }

  void saveUserLatitude({required String latitude}) {
    _cacheHelper.saveData(key: 'latitude', value: latitude);
    _cachedUserLatitude = latitude;
  }

  String? getUserLatitude() {
    _cachedUserLatitude ??= _cacheHelper.getData(key: 'latitude');
    return _cachedUserLatitude;
  }

  void saveUserLongitude({required String longitude}) {
    _cacheHelper.saveData(key: 'longitude', value: longitude);
    _cachedUserLongitude = longitude;
  }

  String? getUserLongitude() {
    _cachedUserLongitude ??= _cacheHelper.getData(key: 'longitude');
    return _cachedUserLongitude;
  }

  void saveCartId({required int cartId}) {
    _cacheHelper.saveData(key: 'cartId', value: cartId);
    _cachedCartId = cartId;
  }

  int? getCartId() {
    _cachedCartId ??= _cacheHelper.getData(key: 'cartId');
    return _cachedCartId;
  }

  Future<void> clearAllUserData() async {
    await _cacheHelper.removeData(key: 'name');
    await _cacheHelper.removeData(key: 'email');
    await _cacheHelper.removeData(key: 'phoneNumber');
    await _cacheHelper.removeData(key: 'avatarUrl');
    await _cacheHelper.removeData(key: 'isGuest');
    await _cacheHelper.removeData(key: 'address');
    await _cacheHelper.removeData(key: 'latitude');
    await _cacheHelper.removeData(key: 'longitude');
    await _cacheHelper.removeData(key: 'cartId');
    _cachedUserName = null;
    _cachedUserEmail = null;
    _cachedUserPhoneNumber = null;
    _cachedUserLogoUrl = null;
    _cachedUserAddress = null;
    _cachedUserLatitude = null;
    _cachedUserLongitude = null;
    _cachedCartId = null;
  }
}
