import 'package:cached_network_image/cached_network_image.dart';
import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_constants.dart';
import 'package:fayoum_club/core/functions/run_if_connected.dart';
import 'package:fayoum_club/core/routes/app_router.dart';
import 'package:fayoum_club/core/widgets/image_loading_effect.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/core/widgets/tag_widget.dart';
import 'package:fayoum_club/features/news/data/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.news});

  final NewsItem news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: GestureDetector(
        onTap: () {
          runIfConnected(
            context: context,
            onConnected: () {
              GoRouter.of(context).push(
                AppRouter.newsDetailsView,
                extra: news,
              );
            },
          );
        },
        child: Container(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: AppColors.lightGreyColor, width: 1.5),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
                child: Stack(
                  children: [
                    /// صورة الخبر
                    CachedNetworkImage(
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl: news.image.isNotEmpty ? news.image : AppConstants.noImageUrl,
                      placeholder: (context, url) => const ImageLoadingEffect(),
                      errorWidget: (context, url, error) => CachedNetworkImage(
                        imageUrl: AppConstants.noImageUrl,
                        placeholder: (context, url) => const ImageLoadingEffect(),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: TagWidget(tag: news.typeOption=='practice'?'ممارسة':"منافسة"),
                    ),
                  ],
                ),
              ),

              const VerticalSpace(6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
                child: Text(
                  news.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const VerticalSpace(8),
            ],
          ),
        ),
      ),
    );
  }
}
