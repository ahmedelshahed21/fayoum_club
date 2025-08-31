// import 'dart:io';
// import 'package:fayoum_club/core/constants/app_colors.dart';
// import 'package:fayoum_club/core/constants/app_strings.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
//
// import '../constants/app_styles.dart';
//
// class UploadButtonPicker extends StatefulWidget {
//   final Function(File?) onImageSelected;
//
//   const UploadButtonPicker({super.key, required this.onImageSelected});
//
//   @override
//   State<UploadButtonPicker> createState() => _UploadButtonPickerState();
// }
//
// class _UploadButtonPickerState extends State<UploadButtonPicker> {
//   File? _selectedImage;
//
//   Future<void> pickImage() async {
//     final picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//
//     if (image != null) {
//       final file = File(image.path);
//       setState(() => _selectedImage = file);
//       widget.onImageSelected(file);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final bool hasImage = _selectedImage != null;
//
//     return GestureDetector(
//       onTap: pickImage,
//       child: SizedBox(
//         width: double.infinity,
//         child: Card(
//           elevation: 1,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//           color: AppColors.pureWhiteColor,
//           shadowColor: AppColors.lightGreyColor,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 12),
//             child: FittedBox(
//               fit: BoxFit.scaleDown,
//               child: Text(
//                 hasImage
//                     ? AppStrings.imageSelected.tr()
//                     : AppStrings.upload.tr(),
//                 style: AppStyles.styleBold18(context)
//                     .copyWith(color: AppColors.primaryColor),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
