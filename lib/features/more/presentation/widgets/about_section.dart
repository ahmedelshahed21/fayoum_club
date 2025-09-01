// import 'package:darbi/core/constants/app_assets.dart';
// import 'package:darbi/core/functions/navigation.dart';
// import 'package:darbi/core/routes/app_router.dart';
// import 'package:darbi/core/widgets/custom_list_tile_widget.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax_flutter/iconsax_flutter.dart';
// import '../../../../core/constants/app_colors.dart';
// import '../../../../core/constants/app_strings.dart';
// import '../../../../core/constants/app_styles.dart';
// import '../../../../core/widgets/spacing.dart';
//
// class AboutSection extends StatelessWidget {
//   const AboutSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const VerticalSpace(16),
//         Text(
//           AppStrings.about.tr(),
//           style: AppStyles.styleExtraBold16(
//             context,
//           ).copyWith(color: AppColors.pureBlackColor),
//         ),
//
//         const VerticalSpace(8),
//         CustomListTileWidget(
//           title: AppStrings.about.tr(),
//           iconData: Iconsax.info_circle_copy,
//           // svgPath: AppAssets.about,
//           onPressed: () {
//             customPush(context, AppRouter.aboutUsView);
//           },
//         ),
//         const VerticalSpace(8),
//         CustomListTileWidget(
//           title: AppStrings.termsAndConditions.tr(),
//           // iconData: Iconsax.document_code_copy,
//           svgPath: AppAssets.termsAndConditionsIcon,
//           onPressed: () {
//             customPush(context, AppRouter.termsAndConditionsView);
//           },
//         ),
//         const VerticalSpace(8),
//         CustomListTileWidget(
//           title: AppStrings.privacy.tr(),
//           svgPath: AppAssets.privacyPolicyIcon,
//           onPressed: () {
//             customPush(context, AppRouter.privacyPolicyView);
//           },
//         ),
//       ],
//     );
//   }
// }
