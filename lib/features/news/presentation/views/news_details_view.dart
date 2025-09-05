import 'package:cached_network_image/cached_network_image.dart';
import 'package:fayoum_club/core/widgets/app_app_bars.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/core/widgets/tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/constants/end_points.dart';
import 'package:fayoum_club/features/news/data/models/news_model.dart';
import 'package:fayoum_club/core/widgets/image_loading_effect.dart';

class NewsDetailsView extends StatelessWidget {
  final NewsItem news;

  const NewsDetailsView({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhiteColor,
      appBar: PrimaryAppBar(title: "تفاصيل الخبر"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
              child: CachedNetworkImage(
                imageUrl: EndPoints.baserUrl + news.image,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => const ImageLoadingEffect(),
                errorWidget: (context, url, error) => Container(
                  height: 220,
                  color: AppColors.lightGreyColor,
                  child: const Icon(Icons.image_not_supported, size: 60),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpace(16),

                  Text(
                    news.title,
                    style: AppStyles.styleBold24(context),
                  ),

                  const VerticalSpace(8),
                  Row(
                    children: [
                      Text(
                        news.createdAt,
                        style: AppStyles.styleMedium14(context),
                      ),
                      const Spacer(),
                      TagWidget(tag: news.typeOption)
                    ],
                  ),
                  const VerticalSpace(16),
                  Text(
                    news.description,
                    style: AppStyles.styleRegular16(context),
                    textAlign: TextAlign.justify,
                  ),
                  const VerticalSpace(24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}