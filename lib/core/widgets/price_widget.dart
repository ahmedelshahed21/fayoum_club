import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:fayoum_club/core/utils/app_strings.dart';
import 'package:fayoum_club/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    required this.price,
    this.priceStyle,
    this.currencyStyle,

  });

  final String price;
  final TextStyle? priceStyle;
  final TextStyle? currencyStyle;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: price,
            style:
                priceStyle ??
                AppStyles.styleBold24(
                  context,
                ).copyWith(color: AppColors.blueColor),
          ),
          const TextSpan(text: ' '),
          TextSpan(
            text: AppStrings.currency.tr(),
            style:
                currencyStyle ??
                AppStyles.styleSemiBold14(
                  context,
                ).copyWith(color: AppColors.pureBlackColor),
          ),
        ],
      ),
    );
  }
}
