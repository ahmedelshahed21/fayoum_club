import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_constants.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/functions/run_if_connected.dart';
import 'package:fayoum_club/core/routes/app_router.dart';
import 'package:fayoum_club/core/widgets/image_loading_effect.dart';
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
        color: AppColors.pureWhiteColor,
        shadowColor: AppColors.offWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(
            color: AppColors.primaryColor.withValues(alpha: 0.3),
            width: 1.5
          )
        ),
        margin: EdgeInsets.symmetric(vertical:2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  width: double.infinity,
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
            ),

            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  activityItem.title!,
                  style: AppStyles.styleBold16(
                    context,
                  ).copyWith(color: AppColors.primaryColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
