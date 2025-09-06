import 'package:cached_network_image/cached_network_image.dart';
import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/routes/app_router.dart';
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
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        GoRouter.of(context).push(AppRouter.trainerDetailsView, extra: trainer);
      },
      child: SizedBox(
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.primaryColor.withValues(alpha: 0.1),
              backgroundImage: trainer.image != null
                  ? CachedNetworkImageProvider(trainer.image!)
                  : null,
              child: trainer.image == null
                  ? Icon(
                Iconsax.user_copy,
                color: AppColors.greenColor,
                size: 32,
              )
                  : null,
            ),

            const VerticalSpace(8),

            // الاسم
            Text(
              trainer.name,
              textAlign: TextAlign.center,
              style: AppStyles.styleBold14(context).copyWith(
                color: AppColors.pureBlackColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}


