// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import '../../../../core/constants/app_assets.dart';
// import '../../../../core/constants/app_colors.dart';
// import '../../../../core/constants/app_styles.dart';
// import '../../../../core/databases/cache/user_data_manager.dart';
// import '../../../../core/functions/navigation.dart';
// import '../../../../core/routes/app_router.dart';
// import '../../../../core/services/service_locator.dart';
// import '../../../../core/widgets/spacing.dart';
//
// class ProfileCard extends StatelessWidget {
//   const ProfileCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     UserDataManager userDataManager = getIt<UserDataManager>();
//     return Row(
//       children: [
//         // SizedBox(
//         //   width: 70,
//         //   height: 70,
//         //   child: ClipRRect(
//         //     borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
//         //     child: CachedNetworkImage(
//         //       imageUrl:  userDataManager.getUserAvatarUrl() ??AppConstants.tempImageUrl,
//         //       fit: BoxFit.fill,
//         //       width: double.infinity,
//         //       placeholder: (context, url) => const ImageLoadingEffect(),
//         //       errorWidget: (context, url, error) => const SizedBox(),
//         //     ),
//         //   ),
//         // ),
//         const HorizontalSpace(12),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children:  [
//               Text(
//                 userDataManager.getUserName() ?? '',
//                 style: AppStyles.styleBold24(context).copyWith(
//                   color: AppColors.primaryColor),
//               ),
//               const VerticalSpace(4),
//               // Text(
//               //     userDataManager.getUserEmail() ?? '',
//               //     style: AppStyles.styleSemiBold14(context).copyWith(
//               //       color: AppColors.greyColor.withValues(alpha: 0.6),
//               //     )),
//               Text(
//                 userDataManager.getUserPhoneNumber() ?? '',
//                 style:AppStyles.styleBold18(context).copyWith(
//                   color: AppColors.pureBlackColor,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         IconButton(
//           icon: SvgPicture.asset(AppAssets.editIcon,height: 30,width: 30,   colorFilter:  ColorFilter.mode(
//             AppColors.greyColor,
//             BlendMode.srcIn,
//           ),),
//           onPressed: () {
//             customPush(context, AppRouter.updateProfileView);
//           },
//         ),
//       ],
//     );
//   }
// }
