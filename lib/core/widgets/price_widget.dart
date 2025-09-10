import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:fayoum_club/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    required this.price,
    this.priceStyle,
    this.currencyStyle,
    required this.currency,
  });

  final String price;
  final String currency;
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
            text: currency,
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
