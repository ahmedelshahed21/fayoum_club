// import 'package:darbi/core/widgets/confirmation_dialog_with_horizontal_buttons.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import '../../../../core/constants/app_assets.dart';
// import '../../../../core/constants/app_colors.dart';
// import '../../../../core/constants/app_strings.dart';
// import '../../../../core/databases/cache/user_data_manager.dart';
// import '../../../../core/functions/is_arabic.dart';
// import '../../../../core/functions/app_snack_bars.dart';
// import '../../../../core/routes/app_router.dart';
// import '../../../../core/services/service_locator.dart';
// import '../../../../core/state_management/user_cubit/user_session_cubit.dart';
// import '../manger/delete_account_cubit/delete_account_cubit.dart';
// import '../manger/delete_account_cubit/delete_account_state.dart';
// class DeleteAccountDialog extends StatelessWidget {
//   const DeleteAccountDialog({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final UserDataManager userDataManager = getIt<UserDataManager>();
//     return BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
//       listener: (context, state) {
//         if (state is DeleteAccountSuccessState) {
//           GoRouter.of(context).go(AppRouter.loginView);
//           context.read<UserSessionCubit>().setGuestStatus(isGuest: true);
//           primarySnackBar(
//             context,
//             isArabic(context)
//                 ? state.success.message.ar
//                 : state.success.message.en,
//             icon: Icons.check_circle_outline,
//             boxColor: AppColors.greenColor,
//           );
//           userDataManager.clearAllUserData();
//         } else if (state is DeleteAccountFailureState) {
//           GoRouter.of(context).pop();
//           primarySnackBar(
//             context,
//             isArabic(context)
//                 ? state.failure.message.ar
//                 : state.failure.message.en,
//             icon: Icons.error_outline,
//             boxColor: AppColors.redColor,
//           );
//         }
//       },
//       builder: (context, state) {
//         return ConfirmationDialogWithHorizontalButtons(
//           isLoading: state is DeleteAccountLoadingState,
//           iconAsset: AppAssets.deleteAccountIcon,
//           title: AppStrings.deleteAccountTitle.tr(),
//           message: AppStrings.deleteAccountMessage.tr(),
//           confirmText: AppStrings.confirm.tr(),
//           cancelText: AppStrings.no.tr(),
//           onConfirm: () {
//             context.read<DeleteAccountCubit>().deleteAccount();
//           },
//           onCancel: () => GoRouter.of(context).pop(),
//         );
//       },
//     );
//   }
// }
