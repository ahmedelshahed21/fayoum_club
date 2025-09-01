// import 'dart:io';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:fayoum_club/core/widgets/app_buttons.dart';
// import 'package:fayoum_club/core/widgets/app_indicators.dart';
// import 'package:fayoum_club/core/widgets/app_text_fields.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/constants/app_colors.dart';
// import '../../../../core/constants/app_strings.dart';
// import '../../../../core/constants/app_styles.dart';
// import '../../../../core/databases/cache/user_data_manager.dart';
// import '../../../../core/functions/is_arabic.dart';
// import '../../../../core/functions/darbi_snack_bars.dart';
// import '../../../../core/services/service_locator.dart';
// import '../../../../core/state_management/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
// import '../../../../core/widgets/spacing.dart';
// import '../manger/update_profile_cubit/update_profile_cubit.dart';
// import '../manger/update_profile_cubit/update_profile_state.dart';
// import 'editable_profile_avatar.dart';
//
// class UpdateProfileForm extends StatefulWidget {
//   const UpdateProfileForm({super.key});
//
//   @override
//   State<UpdateProfileForm> createState() => _UpdateProfileForm();
// }
//
// class _UpdateProfileForm extends State<UpdateProfileForm> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneNumberController = TextEditingController();
//   File? selectedImage;
//
//   @override
//   void initState() {
//     final user = getIt<UserDataManager>();
//     _nameController.text = user.getUserName() ?? '';
//     _emailController.text = user.getUserEmail() ?? '';
//     _phoneNumberController.text = user.getUserPhoneNumber() ?? '';
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<UpdateProfileCubit>(),
//       child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
//         listener: (context, state) {
//           if (state is UpdateProfileSuccess) {
//             setState(() {
//               selectedImage = null;
//             });
//             context.read<BottomNavigationBarCubit>().changeIndex(0);
//             primarySnackBar(
//               context,
//               isArabic(context)
//                   ? state.success.message.ar
//                   : state.success.message.en,
//               icon: Icons.check_circle_outline_outlined,
//               boxColor: AppColors.greenColor,
//             );
//           } else if (state is UpdateProfileFailure) {
//             state.failure.errors == null
//                 ? primarySnackBar(
//                     context,
//                     isArabic(context)
//                         ? state.failure.message.ar
//                         : state.failure.message.en,
//                     icon: Icons.error_outline,
//                     boxColor: AppColors.redColor,
//                   )
//                 : primarySnackBar(
//                     context,
//                     state.failure.errors!.fieldErrors!.values.first.first,
//                     icon: Icons.error_outline,
//                     boxColor: AppColors.redColor,
//                   );
//           }
//         },
//         builder: (context, state) {
//           return Form(
//             key: formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 EditableProfileAvatar(
//                   onImageSelected: (image) {
//                     setState(() => selectedImage = image);
//                     if (image != null) {}
//                   },
//                 ),
//                 const VerticalSpace(16),
//                 SecondaryTextFormField(
//                   fieldName: AppStrings.name.tr(),
//                   hintText: AppStrings.name.tr(),
//                   controller: _nameController,
//                   textInputType: TextInputType.name,
//                 ),
//                 const VerticalSpace(16),
//                 SecondaryTextFormField(
//                   maxLength: 11,
//                   fieldName: AppStrings.phoneNumber.tr(),
//                   hintText: AppStrings.phoneNumber.tr(),
//                   controller: _phoneNumberController,
//                   textInputType: TextInputType.phone,
//                 ),
//                 const VerticalSpace(16),
//                 SecondaryTextFormField(
//                   fieldName: AppStrings.email.tr(),
//                   hintText: AppStrings.email.tr(),
//                   controller: _emailController,
//                   textInputType: TextInputType.emailAddress,
//                 ),
//                 const VerticalSpace(128),
//                 PrimaryButton(
//                   onPressed: () {
//                     FocusScope.of(context).unfocus();
//                     context.read<UpdateProfileCubit>().updateProfile(
//                           name: _nameController.text,
//                           phoneNumber: _phoneNumberController.text,
//                           email: _emailController.text,
//                           avatar: selectedImage,
//                         );
//                   },
//                   child: state is UpdateProfileLoading
//                       ? const PrimaryCircularProgressIndicator()
//                       : Text(
//                           AppStrings.updateProfile.tr(),
//                           style: AppStyles.styleSemiBold20(context)
//                               .copyWith(color: AppColors.pureWhiteColor),
//                         ),
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
