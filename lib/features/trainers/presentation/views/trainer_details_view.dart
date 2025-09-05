import 'package:cached_network_image/cached_network_image.dart';
import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_constants.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/widgets/app_app_bars.dart';
import 'package:fayoum_club/core/widgets/image_loading_effect.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/activites/data/models/activity_details_model/activity_details_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TrainerDetailsView extends StatelessWidget {
  const TrainerDetailsView({super.key, required this.trainer});

  final CaptainModel trainer;
  // final ActivityDetailsData activityDetailsData;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.lightGreyColor,
      appBar: PrimaryAppBar(title: "المدرب"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpace(16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: CachedNetworkImage(
                      imageUrl: trainer.image ?? AppConstants.noImageUrl,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const ImageLoadingEffect(),
                      errorWidget:
                          (context, url, error) => Container(
                            width: 150,
                            height: 150,
                            color: AppColors.pureWhiteColor,
                            child: Icon(
                              Iconsax.user_copy,
                              color: AppColors.greenColor,
                              size: 60,
                            ),
                          ),
                    ),
                  ),
                ),
                VerticalSpace(16),
                Text(
                  trainer.name,
                  style: AppStyles.styleBold20(
                    context,
                  ).copyWith(color: AppColors.pureBlackColor),
                ),
              ],
            ),
            VerticalSpace(48),
            Text(
              trainer.description ?? '',
              style: AppStyles.styleRegular14(
                context,
              ).copyWith(color: AppColors.greyColor),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            VerticalSpace(24),
          ],
        ),
      ),
    );
  }
}
