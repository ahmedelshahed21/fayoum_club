// import 'package:fayoum_club/core/constants/app_colors.dart' show AppColors;
// import 'package:fayoum_club/core/constants/app_colors.dart';
// import 'package:fayoum_club/core/constants/app_styles.dart';
// import 'package:fayoum_club/core/widgets/spacing.dart';
// import 'package:flutter/material.dart';
//
// void fixedSnackBar(BuildContext context,
//     {String? message, IconData? icon, Color? iconColor}) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//         backgroundColor: AppColors.lightGreyColor.withValues(alpha: 0.7),
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         duration: const Duration(seconds: 3),
//         behavior: SnackBarBehavior.floating,
//         margin: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
//         content: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             icon != null
//                 ? Icon(
//                     icon,
//                     color: iconColor ?? Colors.green,
//                     size: 32,
//                   )
//                 : const SizedBox(),
//             const HorizontalSpace(8),
//             Flexible(
//               child: Text(message ?? '',
//                   style: AppStyles.styleSemiBold14(context)
//                       .copyWith(color: AppColors.pureWhiteColor)),
//             ),
//           ],
//         )),
//   );
// }
