// import 'package:easy_localization/easy_localization.dart';
// import 'package:einayatukum/core/data/models/countries_model/country_model.dart';
// import 'package:einayatukum/core/functions/is_arabic.dart';
// import 'package:einayatukum/features/home/presentation/widgets/search_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:einayatukum/core/constants/app_strings.dart';
// import 'package:einayatukum/core/constants/app_styles.dart';
// import 'package:einayatukum/core/constants/app_colors.dart';
// import 'package:einayatukum/core/functions/dummy_lists.dart';
// import 'package:einayatukum/core/widgets/spacing.dart';
// import 'package:einayatukum/core/widgets/fayoum_club_text_fields.dart';
// import 'package:einayatukum/features/splash/presentation/manager/dependencies_cubit/dependencies_cubit.dart';
// import 'package:einayatukum/features/splash/presentation/manager/dependencies_cubit/dependencies_state.dart';
// import 'package:go_router/go_router.dart';

// class PhoneTextField extends StatefulWidget {
//   final TextEditingController controller;
//   final void Function(CountryModel) onCountrySelected;

//   const PhoneTextField({
//     super.key,
//     required this.controller,
//     required this.onCountrySelected,
//   });

//   @override
//   State<PhoneTextField> createState() => _PhoneTextFieldState();
// }

// class _PhoneTextFieldState extends State<PhoneTextField> {
//   CountryModel? selectedCountry;

//   String getFlagEmoji(String countryCode) {
//     final int flagOffset = 0x1F1E6 - 'A'.codeUnitAt(0);
//     return countryCode
//         .toUpperCase()
//         .codeUnits
//         .map((c) => String.fromCharCode(flagOffset + c))
//         .join();
//   }

//   void showCountryPicker(List<CountryModel> countries) {
//     TextEditingController searchController = TextEditingController();
//     List<CountryModel> filteredCountries = List.from(countries);

//     showModalBottomSheet(
//       context: context,
//       backgroundColor: AppColors.pureWhiteColor,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
//       ),
//       builder: (_) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       top: 32, left: 32, right: 32, bottom: 8),
//                   child: SearchField(
//                     controller: searchController,
//                     hintText: AppStrings.search.tr(),
//                     onChanged: (value) {
//                       setState(() {
//                         filteredCountries = countries.where((country) {
//                           final name = isArabic(context)
//                               ? country.arName.toLowerCase()
//                               : country.enName.toLowerCase();
//                           return name.contains(value.toLowerCase());
//                         }).toList();
//                       });
//                     },
//                   ),
//                 ),
//                 VerticalSpace(16),
//                 Expanded(
//                   child: ListView.separated(
//                     padding: const EdgeInsets.symmetric(horizontal: 32),
//                     physics: const BouncingScrollPhysics(),
//                     itemCount: filteredCountries.length,
//                     separatorBuilder: (context, index) => VerticalSpace(8),
//                     itemBuilder: (context, index) {
//                       final country = filteredCountries[index];
//                       return InkWell(
//                         onTap: () {
//                           setState(() {
//                             selectedCountry = country;
//                           });
//                           widgets.onCountrySelected(country);
//                           GoRouter.of(context).pop();
//                         },
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               getFlagEmoji(country.countryCode),
//                               style: const TextStyle(fontSize: 24),
//                             ),
//                             HorizontalSpace(8),
//                             Text(
//                               isArabic(context)
//                                   ? country.arName
//                                   : country.enName,
//                               style: AppStyles.styleSemiBold16(context)
//                                   .copyWith(color: AppColors.primaryColor),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<DependenciesCubit, DependenciesState>(
//       builder: (context, state) {
//         Widget prefix;
//         if (state is DependenciesSuccessState) {
//           final countries = state.countries;
//           selectedCountry ??= countries.first;
//           prefix = GestureDetector(
//             onTap: () => showCountryPicker(countries),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   getFlagEmoji(selectedCountry!.countryCode),
//                   style: AppStyles.styleSemiBold18(context),
//                 ),
//                 const HorizontalSpace(6),
//                 Text(
//                   '+${getPhoneCodes()[selectedCountry!.countryCode] ?? ''}',
//                   style: AppStyles.styleSemiBold18(context)
//                       .copyWith(color: AppColors.primaryColor),
//                 ),
//               ],
//             ),
//           );
//         } else {
//           prefix = const SizedBox(
//             width: 32,
//             height: 32,
//             child: Center(child: CircularProgressIndicator()),
//           );
//         }

//         return PrimaryTextFormField(
//           controller: widgets.controller,
//           hintText: AppStrings.phoneNumber.tr(),
//           type: TextInputType.phone,
//           maxLines: 1,
//           minLines: 1,
//           maxLength: 11,
//           prefixIcon: Padding(
//             padding: const EdgeInsetsDirectional.only(end: 8.0),
//             child: prefix,
//           ),
//         );
//       },
//     );
//   }
// }
