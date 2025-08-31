// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fayoum_club/core/constants/app_assets.dart';
// import 'package:fayoum_club/core/constants/app_colors.dart';
// import 'package:fayoum_club/core/functions/navigation.dart';
// import 'package:fayoum_club/core/routes/app_router.dart';
// import 'package:fayoum_club/core/widgets/spacing.dart';
// import 'package:fayoum_club/features/search/presentation/widgets/search_text_field.dart';
//
// class SearchContainer extends StatelessWidget {
//   const SearchContainer({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//         customPush(context, AppRouter.searchView);
//       },
//       child: Container(
//         height: 50,
//         padding: const EdgeInsets.symmetric(horizontal: 12),
//         decoration: BoxDecoration(
//           color: AppColors.pureWhiteColor,
//           borderRadius: BorderRadius.circular(24),
//           border: Border.all(color: AppColors.lightGreyColor, width: 1),
//           boxShadow: [BoxShadow(color: AppColors.lightGreyColor)],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SvgPicture.asset(
//               AppAssets.searchIcon,
//               width: 20,
//               height: 20,
//             ),
//             const HorizontalSpace(8),
//             Expanded(
//               child: SearchTextField(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
