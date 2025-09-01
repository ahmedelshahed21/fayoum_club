import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/fayoum_club_app.dart';
import 'core/databases/cache/cache_helper.dart';
import 'core/services/observer.dart';
import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  // OneSignal.initialize(AppConstants.appId);
  // OneSignal.Notifications.requestPermission(true);

  await EasyLocalization.ensureInitialized();
  await CacheHelper().init();
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      child: FayoumClubApp(),
    ),
  );
}
