import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/core/utils/app_strings.dart';

String? newsTypeOption(String type) {
  switch (type) {
    case 'practice':
      return  AppStrings.practice.tr();
    case 'competition':
      return AppStrings.competition.tr();
    default:
      return null;
  }
}