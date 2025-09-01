// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax_flutter/iconsax_flutter.dart';
// import '../../../../core/constants/app_colors.dart';
// import '../../../../core/constants/app_strings.dart';
// import '../../../../core/constants/app_styles.dart';
// import '../../../../core/functions/navigation.dart';
// import '../../../../core/routes/app_router.dart';
// import '../../../../core/widgets/custom_list_tile_widget.dart';
// import '../../../../core/widgets/spacing.dart';
//
// class SettingsSection extends StatelessWidget {
//   const SettingsSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const VerticalSpace(16),
//           Text(
//             AppStrings.settings.tr(),
//             style: AppStyles.styleExtraBold16(
//               context,
//             ).copyWith(color: AppColors.pureBlackColor),
//           ),
//           const VerticalSpace(8),
//           CustomListTileWidget(
//             title: AppStrings.changeLanguage.tr(),
//             iconData: Iconsax.language_circle_copy,
//             // svgPath: AppAssets.languageIcon,
//             onPressed: () {
//               customPush(context, AppRouter.changeLanguageView);
//             },
//           ),
//
//         ]
//     );
//   }
// }
