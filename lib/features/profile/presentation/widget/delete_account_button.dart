// import 'package:darbi/core/constants/app_colors.dart';
// import 'package:darbi/core/constants/app_strings.dart';
// import 'package:darbi/core/constants/app_styles.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// class DeleteAccountButton extends StatelessWidget {
//   const DeleteAccountButton({
//     super.key, required this.onPressed,
//   });
//   final void Function() onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       style: ElevatedButton.styleFrom(
//         foregroundColor: AppColors.greyColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//       onPressed: onPressed,
//       child: Text(
//         AppStrings.deleteAccount.tr(),
//         style: AppStyles.styleSemiBold20(context)
//             .copyWith(color: AppColors.redColor),
//       ),
//     );
//   }
// }
