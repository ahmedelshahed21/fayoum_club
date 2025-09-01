// import 'package:dartz/dartz.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:fayoum_club/features/profile/data/model/change_password_models/change_password_request_model.dart';
// import '../../../../../../core/constants/app_strings.dart';
// import '../../../../../../core/constants/end_points.dart';
// import '../../../../../../core/data/models/auth_failure_model.dart';
// import '../../../../../../core/data/models/basic_model.dart';
// import '../../../../../../core/databases/api/dio_consumer.dart';
// import '../../../../../../core/databases/cache/secure_storage_helper.dart';
// import '../../../../../../core/state_management/network_connection_cubit/network_connection_cubit.dart';
// import '../../../../../core/data/models/localized_text_model.dart';
// import 'change_password_repo.dart';
//
// class ChangePasswordRepoImpl implements ChangePasswordRepo {
//   final DioConsumer dioConsumer;
//   final SecureStorageHelper secureStorageHelper;
//   final NetworkConnectionCubit networkCubit;
//
//   ChangePasswordRepoImpl({
//     required this.dioConsumer,
//     required this.secureStorageHelper,
//     required this.networkCubit,
//   });
//
//   @override
//   Future<Either<AuthFailureModel, BasicModel>>changePassword ({
//     required ChangePasswordRequestModel data
//   }) async {
//     final isConnected = await networkCubit.networkInfo.isConnected;
//     if (!isConnected) {
//       return Left(
//         AuthFailureModel(
//           status: false,
//           message: LocalizedText(
//             ar: AppStrings.noInternetConnection.tr(),
//             en: AppStrings.noInternetConnection.tr(),
//           ),
//           errors: ErrorDetails(
//             message: AppStrings.noInternetConnection.tr(),
//             fieldErrors: {
//               ApiKey.errors: [AppStrings.noInternetConnection.tr()],
//             },
//           ),
//         ),
//       );
//     }
//
//     final token = await secureStorageHelper.getToken();
//
//     try {
//       final response = await dioConsumer.put(
//         EndPoints.updatePassword,
//         headers: {
//           Params.authorization: '${Params.bearer} $token',
//           Params.accept:Params.applicationJson,
//         },
//         data: data.toJson()
//       );
//       if (response is Map<String, dynamic>) {
//
//         if (response[ApiKey.status] == true) {
//           return right(BasicModel.fromJson(response));
//         } else {
//           return left(AuthFailureModel.fromJson(response));
//         }
//       } else {
//         return left(  AuthFailureModel(
//           status: false,
//           message: LocalizedText(
//             ar: AppStrings.serverConnectionFailed.tr(),
//             en: AppStrings.serverConnectionFailed.tr(),
//           ),
//           errors: ErrorDetails(
//             message: AppStrings.serverConnectionFailed.tr(),
//             fieldErrors: {
//               ApiKey.errors: [AppStrings.serverConnectionFailed.tr()],
//             },
//           ),
//         ),);
//       }
//     } catch (e) {
//       return left(AuthFailureModel(
//         status: false,
//         message: LocalizedText(
//           ar: AppStrings.serverConnectionFailed.tr(),
//           en: AppStrings.serverConnectionFailed.tr(),
//         ),
//         errors: ErrorDetails(
//           message: AppStrings.serverConnectionFailed.tr(),
//           fieldErrors: {
//             ApiKey.errors: [AppStrings.serverConnectionFailed.tr()],
//           },
//         ),
//       ),);
//     }
//   }
// }