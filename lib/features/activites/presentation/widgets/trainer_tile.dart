import 'package:cached_network_image/cached_network_image.dart';
import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_constants.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/routes/app_router.dart';
import 'package:fayoum_club/core/widgets/image_loading_effect.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:fayoum_club/features/activites/data/models/activity_details_model/activity_details_model.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TrainerTile extends StatelessWidget {
  const TrainerTile({super.key, required this.trainer});

  final CaptainModel trainer;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: AppColors.primaryColor.withValues(alpha: 0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(256),
              child: CachedNetworkImage(
                imageUrl: trainer.image??AppConstants.noImageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                placeholder: (context, url) => const ImageLoadingEffect(),
                errorWidget:
                    (context, url, error) => Container(
                      width: 80,
                      height: 80,
                      color: AppColors.pureWhiteColor,
                      child: Icon(
                        Iconsax.user_copy,
                        color: AppColors.greenColor,
                        size: 42,
                      ),
                    ),
              ),
            ),
            HorizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    trainer.name,
                    style: AppStyles.styleBold18(
                      context,
                    ).copyWith(color: AppColors.pureBlackColor),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
             GoRouter.of(context).push(AppRouter.trainerView,extra: trainer);
              },
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppColors.pureBlackColor,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
