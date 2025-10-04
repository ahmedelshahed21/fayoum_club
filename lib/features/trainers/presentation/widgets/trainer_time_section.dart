import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:fayoum_club/core/utils/app_styles.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/activites/data/models/activity_details_model/activity_details_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TrainerTimeSection extends StatelessWidget {
  const TrainerTimeSection({
    super.key,
    required this.trainer,
  });

  final CaptainModel trainer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "المواعيد",
            style: AppStyles.styleSemiBold16(
              context,
            ).copyWith(color: AppColors.pureBlackColor),
          ),
        ),
        VerticalSpace(16),
        if (trainer.time.isEmpty)
          Center(
            child: Text(
              "لا توجد مواعيد حالياً",
              style: AppStyles.styleRegular14(
                context,
              ).copyWith(color: AppColors.greyColor),
            ),
          )
        else
          Column(
            children: trainer.time.map((t) {
              return Card(
                color: AppColors.pureWhiteColor,
                margin: const EdgeInsets.only(bottom: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Iconsax.calendar_1_copy,
                        color: AppColors.greyColor,
                      ),
                      HorizontalSpace(12),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              t.day,
                              style: AppStyles.styleBold18(
                                context,
                              ).copyWith(
                                color: AppColors.greenColor,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "${_formatTime12(t.fromTime)} - ${_formatTime12(t.toTime)}",
                              style: AppStyles.styleSemiBold16(
                                context,
                              ).copyWith(
                                color: AppColors.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }


  String _formatTime12(String time24) {
    try {
      final parts = time24.split(':');
      int hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);
      final period = hour >= 12 ? 'م' : 'ص';
      hour = hour % 12;
      if (hour == 0) hour = 12; // 12 صباحاً أو مساءً
      return "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period";
    } catch (e) {
      return time24;
    }
  }
}