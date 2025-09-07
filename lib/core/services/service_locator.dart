import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:fayoum_club/features/activites/data/repos/activites_repo/activites_repo.dart';
import 'package:fayoum_club/features/activites/data/repos/activites_repo/activites_repo_impl.dart';
import 'package:fayoum_club/features/activites/data/repos/activity_details_repo/activity_details_repo.dart';
import 'package:fayoum_club/features/activites/data/repos/activity_details_repo/activity_details_repo_impl.dart';
import 'package:fayoum_club/features/activites/presentation/manager/activity_details_cubit/activity_details_cubit.dart';
import 'package:fayoum_club/features/more/data/repos/contact_us_repo/contact_us_repo_impl.dart';
import 'package:fayoum_club/features/more/presentation/manager/contact_us_cubit/contact_us_cubit.dart';
import 'package:fayoum_club/features/home/data/repos/banners_repo/banners_repo.dart';
import 'package:fayoum_club/features/home/data/repos/banners_repo/banners_repo_impl.dart';
import 'package:fayoum_club/features/activites/presentation/manager/activites_cubit/activites_cubit.dart';
import 'package:fayoum_club/features/home/presentation/manager/banners_cubit/banners_cubit.dart';
import 'package:fayoum_club/features/news/data/repos/news_repo/news_repo.dart';
import 'package:fayoum_club/features/news/data/repos/news_repo/news_repo_impl.dart';
import 'package:fayoum_club/features/news/presentation/manager/news_cubit/news_cubit.dart';
import 'package:fayoum_club/features/payment/data/repos/payment_process_repo/payment_process_repo_impl.dart';
import 'package:fayoum_club/features/payment/presentation/manager/payment_process_cubit/payment_process_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../features/login/data/repos/login_repo_impl.dart';
import '../../features/login/presentation/manager/login_cubit.dart';
import '../../features/register/data/repos/register_repo_impl.dart';
import '../../features/register/presentation/manager/register_cubit.dart';
import '../databases/api/dio_consumer.dart';
import '../databases/cache/app_data_manager.dart';
import '../databases/cache/cache_helper.dart';
import '../databases/cache/secure_storage_helper.dart';
import '../databases/cache/user_data_manager.dart';
import '../state_management/network_connection_cubit/network_connection_cubit.dart';
import '../state_management/network_connection_cubit/network_info.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Core services
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerSingleton<AppDataManager>(AppDataManager(getIt<CacheHelper>()));
  getIt.registerSingleton<UserDataManager>(
    UserDataManager(getIt<CacheHelper>()),
  );
  getIt.registerLazySingleton<SecureStorageHelper>(() => SecureStorageHelper());
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: Dio()));
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(DataConnectionChecker()),
  );
  getIt.registerLazySingleton<NetworkConnectionCubit>(
    () => NetworkConnectionCubit(getIt<NetworkInfo>()),
  );

  // Login dependencies
  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(
      dioConsumer: getIt.get<DioConsumer>(),
      secureStorageHelper: getIt<SecureStorageHelper>(),
      userDataManager: getIt<UserDataManager>(),
      networkCubit: getIt<NetworkConnectionCubit>(),
    ),
  );
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(loginRepo: getIt<LoginRepoImpl>()),
  );
  // Register dependencies
  getIt.registerSingleton<RegisterRepoImpl>(
    RegisterRepoImpl(
      dioConsumer: getIt.get<DioConsumer>(),
      secureStorageHelper: getIt<SecureStorageHelper>(),
      userDataManager: getIt<UserDataManager>(),
      networkCubit: getIt<NetworkConnectionCubit>(),
    ),
  );
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(registerRepo: getIt<RegisterRepoImpl>()),
  );

  // Banners dependencies
  getIt.registerLazySingleton<BannersRepo>(
    () => BannersRepoImpl(
      dioConsumer: getIt<DioConsumer>(),
      networkCubit: getIt<NetworkConnectionCubit>(),
    ),
  );
  getIt.registerFactory<BannersCubit>(
    () => BannersCubit(news: getIt<BannersRepo>()),
  );

  // Activites dependencies
  getIt.registerLazySingleton<ActivitesRepo>(
    () => ActivitesRepoImpl(
      dioConsumer: getIt<DioConsumer>(),
      networkCubit: getIt<NetworkConnectionCubit>(),
    ),
  );
  getIt.registerFactory<ActivitesCubit>(
    () => ActivitesCubit(activites: getIt<ActivitesRepo>()),
  );

  // Activity Details dependencies
  getIt.registerLazySingleton<ActivityDetailsRepo>(
    () => ActivityDetailsRepoImpl(
      dioConsumer: getIt<DioConsumer>(),
      networkCubit: getIt<NetworkConnectionCubit>(),
    ),
  );
  getIt.registerFactory<ActivityDetailsCubit>(
    () =>
        ActivityDetailsCubit(activityDetailsRepo: getIt<ActivityDetailsRepo>()),
  );

  // News dependencies
  getIt.registerLazySingleton<NewsRepo>(
        () => NewsRepoImpl(
      dioConsumer: getIt<DioConsumer>(),
      networkCubit: getIt<NetworkConnectionCubit>(),
    ),
  );
  getIt.registerFactory<NewsCubit>(() => NewsCubit(newsRepo: getIt<NewsRepo>()));

// Payment dependencies
  getIt.registerSingleton<PaymentProcessRepoImpl>(
    PaymentProcessRepoImpl(
      dioConsumer: getIt<DioConsumer>(),
      secureStorageHelper: getIt<SecureStorageHelper>(),
      networkCubit: getIt<NetworkConnectionCubit>(),
    ),
  );

  getIt.registerFactory<PaymentProcessCubit>(
        () => PaymentProcessCubit(paymentProcessRepo: getIt<PaymentProcessRepoImpl>()),
  );

  // Contact Us dependencies
  getIt.registerSingleton<ContactUsRepoImpl>(
    ContactUsRepoImpl(
      dioConsumer: getIt.get<DioConsumer>(),
      secureStorageHelper: getIt<SecureStorageHelper>(),
      networkCubit: getIt<NetworkConnectionCubit>(),
    ),
  );
  getIt.registerFactory<ContactUsCubit>(
    () => ContactUsCubit(contactUsRepo: getIt<ContactUsRepoImpl>()),
  );
}
