// import 'package:fayoum_club/core/constants/app_assets.dart';
// import 'package:fayoum_club/core/constants/app_colors.dart';
// import 'package:fayoum_club/core/constants/app_strings.dart';
// import 'package:fayoum_club/core/constants/app_styles.dart';
// import 'package:fayoum_club/core/functions/navigation.dart';
// import 'package:fayoum_club/core/routes/app_router.dart';
// import 'package:fayoum_club/core/widgets/fayoum_club_buttons.dart';
// import 'package:fayoum_club/core/widgets/have_an_account.dart';
// import 'package:fayoum_club/core/widgets/spacing.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// class OTPVerificationView extends StatefulWidget {
//   const OTPVerificationView({super.key});
//
//   @override
//   OTPVerificationViewState createState() => OTPVerificationViewState();
// }
//
// class OTPVerificationViewState extends State<OTPVerificationView> {
//   TextEditingController otpController = TextEditingController();
//   FocusNode otpFocusNode = FocusNode();
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       FocusScope.of(context).requestFocus(otpFocusNode);
//     });
//   }
//
//   @override
//   void dispose() {
//     otpFocusNode.dispose();
//     otpController.dispose();
//     super.dispose();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.pureWhiteColor,
//       body: Padding(
//         padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Spacer(),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Center(child: Image.asset(AppAssets.otp)),
//                 VerticalSpace(8),
//                 Text(
//                   AppStrings.pleaseEnterTheOtpSentTo.tr(),
//                   style: AppStyles.styleRegular16(context)
//                       .copyWith(color: AppColors.greyColor),
//                 ),
//                 Localizations.override(
//                   context: context,
//                   locale: Locale('en'),
//                   child: Text(
//                     "+39 234 556 7988",
//                     style: AppStyles.styleRegular16(context)
//                         .copyWith(color: AppColors.greyColor),
//                   ),
//                 ),
//               ],
//             ),
//             VerticalSpace(32),
//             Localizations.override(
//               context: context,
//               locale: Locale('en'),
//               child: PinCodeTextField(
//                 focusNode: otpFocusNode,
//                 appContext: context,
//                 length: 4,
//                 controller: otpController,
//                 keyboardType: TextInputType.number,
//                 textStyle: AppStyles.styleBold25(context)
//                     .copyWith(color: AppColors.primaryColor),
//                 pinTheme: PinTheme(
//                   borderRadius: BorderRadius.circular(12),
//                   shape: PinCodeFieldShape.box,
//                   fieldHeight: 50,
//                   fieldWidth: 50,
//                   activeColor: AppColors.primaryColor,
//                   inactiveColor: AppColors.lightGreyColor,
//                   selectedColor: AppColors.primaryColor,
//                 ),
//                 onChanged: (value) {},
//               ),
//             ),
//             Spacer(flex: 3),
//             PrimaryButton(
//               text: AppStrings.next.tr(),
//               onPressed: () {
//                 FocusScope.of(context).unfocus();
//                 customPush(context, AppRouter.verificationSuccessView);
//               },
//             ),
//             HaveAnAccount(
//               text: AppStrings.didNotGetTheCode.tr(),
//               textButton: AppStrings.resend.tr(),
//               onPressed: () {
//
//               },
//             ),
//             VerticalSpace(24),
//           ],
//         ),
//       ),
//     );
//   }
// }
