import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/core/widgets/app_app_bars.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/core/widgets/tag_widget.dart';
import 'package:fayoum_club/features/news/presentation/widgets/related_news_section.dart';
import 'package:flutter/material.dart';
import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/features/news/data/models/news_model.dart';
import 'package:fayoum_club/core/widgets/image_loading_effect.dart';

class NewsDetailsView extends StatelessWidget {
  final NewsItem news;

  const NewsDetailsView({super.key, required this.news});

  /// نفس logic الـ NewsTile
  String? _mapTypeOption(String? type) {
    switch (type) {
      case 'practice':
        return 'ممارسة';
      case 'competition':
        return 'منافسة';
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat(
      'dd/MM/yyyy  HH:mm',
      'en',
    ).format(news.createdAt);

    final tag = _mapTypeOption(news.typeOption);

    return Scaffold(
      backgroundColor: AppColors.offWhiteColor,
      appBar: PrimaryAppBar(title: "تفاصيل الخبر"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              child: CachedNetworkImage(
                imageUrl: news.image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => const ImageLoadingEffect(),
                errorWidget: (context, url, error) => Container(
                  height: 200,
                  color: AppColors.lightGreyColor,
                  child: const Icon(
                    Icons.image_not_supported,
                    size: 60,
                  ),
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
                    style: AppStyles.styleBold20(context)
                        .copyWith(color: AppColors.pureBlackColor),
                  ),
                  const VerticalSpace(12),
                  Row(
                    children: [
                      if (tag != null)
                        TagWidget(
                          tag: tag,
                          backgroundColor:
                          AppColors.primaryColor.withValues(alpha: 0.3),
                          textColor: AppColors.pureBlackColor,
                        ),
                      const Spacer(),
                      Text(
                        formattedDate,
                        style: AppStyles.styleMedium14(context),
                      ),
                    ],
                  ),
                  const VerticalSpace(32),
                  Text(
                    news.description,
                    style: AppStyles.styleRegular16(context),
                    textAlign: TextAlign.justify,
                  ),
                  const VerticalSpace(64),
                  if (news.activate != null) RelatedNewsSection(news: news),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
