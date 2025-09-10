import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:fayoum_club/core/utils/app_strings.dart';
import 'package:fayoum_club/core/utils/app_styles.dart';
import 'package:fayoum_club/core/functions/navigation.dart';
import 'package:fayoum_club/core/routes/app_router.dart';
import 'package:fayoum_club/core/state_management/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:fayoum_club/core/widgets/app_buttons.dart';
import 'package:fayoum_club/core/widgets/price_widget.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessViewBody extends StatelessWidget {
  const SuccessViewBody({
    super.key,
    required this.transactionId,
    required this.amount,
  });

  final String transactionId;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Iconsax.tick_circle_copy,
              color: AppColors.greenColor,
              size: 100,
            ),
            const VerticalSpace(12),
            Text(
              AppStrings.paymentSuccess.tr(),
              style: AppStyles.styleBold28(
                context,
              ).copyWith(color: AppColors.greenColor),
              textAlign: TextAlign.center,
            ),
            const VerticalSpace(32),
            Column(
              children: [
                Text(
                  AppStrings.transactionNumber.tr(),
                  style: AppStyles.styleBold14(
                    context,
                  ).copyWith(color: AppColors.pureBlackColor),
                ),
                Center(
                  child: Text(
                    transactionId,
                    style: AppStyles.styleBold28(
                      context,
                    ).copyWith(color: AppColors.blueColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            // Text(
            //   "${AppStrings.transactionNumber.tr()}: $transactionId",
            //   style: AppStyles.styleMedium16(context),
            // ),
            const VerticalSpace(24),
            Column(
              children: [
                Text(
                  "المبلغ المدفوع",
                  style: AppStyles.styleBold14(
                    context,
                  ).copyWith(color: AppColors.pureBlackColor),
                ),
                PriceWidget(
                  price: amount,
                  priceStyle: AppStyles.styleBold32(
                    context,
                  ).copyWith(color: AppColors.blueColor),
                  currency: 'ج.م',
                ),
              ],
            ),
            const VerticalSpace(100),
            PrimaryButton(
              text: 'العودة إلي الرئيسية',
              onPressed: () {
                context.read<BottomNavigationBarCubit>().changeIndex(0);
                customGo(context, AppRouter.homePage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
