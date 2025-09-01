// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax_flutter/iconsax_flutter.dart';
// import '../../../../core/constants/app_strings.dart';
// import '../../../../core/functions/navigation.dart';
// import '../../../../core/routes/app_router.dart';
// import '../../../../core/widgets/custom_list_tile_widget.dart';
// import '../../../../core/widgets/spacing.dart';
//
// class ProfileSection extends StatelessWidget {
//   const ProfileSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const VerticalSpace(8),
//         CustomListTileWidget(
//           iconData: Iconsax.user_copy,
//           // svgPath: AppAssets.userIcon,
//           title: AppStrings.updateProfile.tr(),
//           onPressed: () {
//             customPush(context, AppRouter.updateProfileView);
//           },
//         ),
//         const VerticalSpace(8),
//         CustomListTileWidget(
//           iconData: Iconsax.lock_1_copy,
//           // svgPath: AppAssets.lockIcon,
//           title: AppStrings.changePassword.tr(),
//           onPressed: () {
//             customPush(context, AppRouter.changePasswordView);
//           },
//         ),
//         const VerticalSpace(24),
//       ],
//     );
//   }
// }
