// import 'package:fayoum_club/core/constants/app_strings.dart';
// import 'package:fayoum_club/core/databases/cache/app_data_manager.dart';
// import 'package:fayoum_club/core/databases/cache/cache_helper.dart';
// import 'package:fayoum_club/core/functions/navigation.dart';
// import 'package:fayoum_club/core/routes/app_router.dart';
// import 'package:fayoum_club/core/services/service_locator.dart';
// import 'package:fayoum_club/core/widgets/app_buttons.dart';
// import 'package:fayoum_club/core/widgets/language_selection_tile.dart';
// import 'package:fayoum_club/core/widgets/spacing.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// class WelcomeView extends StatefulWidget {
//   const WelcomeView({super.key});
//
//   @override
//   State<WelcomeView> createState() => _WelcomeViewState();
// }
//
// class _WelcomeViewState extends State<WelcomeView> {
//   String selectedLanguage = 'ar';
//   final CacheHelper _cacheHelper = getIt<CacheHelper>();
//
//   @override
//   void initState() {
//     super.initState();
//     _loadSavedLanguage();
//   }
//
//   Future<void> _loadSavedLanguage() async {
//     final savedLanguage = await _cacheHelper.getData(key: 'language');
//     if (savedLanguage != null) {
//       setState(() {
//         selectedLanguage = savedLanguage;
//         context.setLocale(Locale(savedLanguage));
//       });
//     }
//   }
//
//   Future<void> saveLanguage(String languageCode) async {
//     await _cacheHelper.saveData(key: 'language', value: languageCode);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const VerticalSpace(48),
//               LanguageSelectionTile(
//                 groupValue: selectedLanguage,
//                 onChangEnglish: (value) {
//                   if (value != null) {
//                     setState(() {
//                       selectedLanguage = value;
//                       context.setLocale(const Locale('en'));
//                       saveLanguage('en');
//                     });
//                   }
//                 },
//                 onChangArabic: (value) {
//                   if (value != null) {
//                     setState(() {
//                       selectedLanguage = value;
//                       context.setLocale(const Locale('ar'));
//                       saveLanguage('ar');
//                     });
//                   }
//                 },
//               ),
//               const Spacer(flex: 3),
//               GoButton(
//                 text: AppStrings.continue1.tr(),
//                 onPressed: () {
//                   final appDataManager = getIt<AppDataManager>();
//                   appDataManager.saveIsSelectLanguageViewVisited(
//                     isSelectLanguageViewVisited: true,
//                   );
//                   customPushReplacement(context, AppRouter.loginView);
//                 },
//               ),
//               const VerticalSpace(32),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
