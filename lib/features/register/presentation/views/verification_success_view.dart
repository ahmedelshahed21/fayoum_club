// import 'package:fayoum_club/core/constants/app_assets.dart';
// import 'package:fayoum_club/core/constants/app_colors.dart';
// import 'package:fayoum_club/core/constants/app_strings.dart';
// import 'package:fayoum_club/core/constants/app_styles.dart';
// import 'package:fayoum_club/core/functions/navigation.dart';
// import 'package:fayoum_club/core/routes/app_router.dart';
// import 'package:fayoum_club/core/widgets/fayoum_club_buttons.dart';
// import 'package:fayoum_club/core/widgets/spacing.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
//
// class VerificationSuccessView extends StatelessWidget {
//   const VerificationSuccessView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.pureWhiteColor,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Spacer(flex: 3),
//             Center(child: Image.asset(AppAssets.success)),
//             const VerticalSpace(24),
//             Text(
//               AppStrings.thankYou.tr(),
//               style: AppStyles.styleMedium22(context).copyWith(
//                   color: AppColors.lightBlackColor),
//             ),
//             const VerticalSpace(12),
//             Text(
//               AppStrings.verificationHasDone.tr(),
//               style: AppStyles.styleMedium12(context).copyWith(
//                   color: AppColors.lightBlackColor),
//             ),
//             const Spacer(flex: 4),
//             PrimaryButton(
//                 text: AppStrings.next.tr(),
//                 onPressed: () {
//                   customGo(context,AppRouter.homePage);
//                 }),
//             const Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }
