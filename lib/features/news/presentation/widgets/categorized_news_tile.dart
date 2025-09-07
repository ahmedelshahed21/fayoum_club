import 'package:cached_network_image/cached_network_image.dart';
import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_constants.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/functions/run_if_connected.dart';
import 'package:fayoum_club/core/routes/app_router.dart';
import 'package:fayoum_club/core/widgets/image_loading_effect.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/news/data/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategorizedNewsTile extends StatelessWidget {
  const CategorizedNewsTile({super.key, required this.news});

  final NewsItem news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: () {
          runIfConnected(
            context: context,
            onConnected: () {
              GoRouter.of(context).push(AppRouter.newsDetailsView, extra: news);
            },
          );
        },
        child: Container(
          decoration: ShapeDecoration(
            color: AppColors.pureWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              // side: BorderSide(color: AppColors.lightGreyColor, width: 1.5),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// صورة الخبر
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(7),
                  bottomLeft: Radius.circular(7),
                ),
                child: CachedNetworkImage(
                  height: 86,
                  width: 86,
                  fit: BoxFit.cover,
                  imageUrl: news.image.isNotEmpty
                      ? news.image
                      : AppConstants.noImageUrl,
                  placeholder: (context, url) => const ImageLoadingEffect(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),

              const HorizontalSpace(8),

              /// عنوان الخبر
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  child: Text(
                    news.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.styleSemiBold14(
                      context,
                    ).copyWith(color: AppColors.greyColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


