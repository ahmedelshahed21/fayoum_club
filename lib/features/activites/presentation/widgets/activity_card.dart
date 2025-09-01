import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_constants.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/functions/run_if_connected.dart';
import 'package:fayoum_club/core/routes/app_router.dart';
import 'package:fayoum_club/core/widgets/image_loading_effect.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fayoum_club/features/activites/data/models/activites_model/activites_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ActivityCard extends StatelessWidget {
  final ActivityItem activityItem;

  const ActivityCard({super.key, required this.activityItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => runIfConnected(
            context: context,
            onConnected: () {
              GoRouter.of(context).push(AppRouter.activityDetailsView, extra: activityItem.id);
            },
          ),
      child: Card(
        color: AppColors.primaryColor.withValues(alpha: 0.8),
        shadowColor: AppColors.offWhiteColor,
        margin: EdgeInsets.symmetric(vertical: 16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: activityItem.image ?? AppConstants.noImageUrl,
                  placeholder: (context, url) => const ImageLoadingEffect(),
                  errorWidget:
                      (context, url, error) => CachedNetworkImage(
                        placeholder:
                            (context, url) => const ImageLoadingEffect(),
                        imageUrl: AppConstants.noImageUrl,
                        errorWidget:
                            (context, url, error) => const Icon(Icons.error),
                      ),
                ),
              ),
              VerticalSpace(8),
              Center(
                child: Text(
                  activityItem.title!,
                  style: AppStyles.styleSemiBold18(
                    context,
                  ).copyWith(color: AppColors.pureWhiteColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              VerticalSpace(4),
            ],
          ),
        ),
      ),
    );
  }
}
