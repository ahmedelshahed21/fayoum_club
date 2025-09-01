import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/constants/end_points.dart';
import 'package:fayoum_club/features/news/data/models/news_model.dart';
import 'package:fayoum_club/core/functions/is_arabic.dart';
import 'package:fayoum_club/core/functions/run_if_connected.dart';
import 'package:fayoum_club/core/routes/app_router.dart';
import 'package:fayoum_club/core/widgets/image_loading_effect.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BannersSliders extends StatefulWidget {
  const BannersSliders({super.key, required this.newsData});

  final List<NewsItem> newsData;

  @override
  State<BannersSliders> createState() => _BannersSlidersState();
}

class _BannersSlidersState extends State<BannersSliders> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.newsData.length,
          itemBuilder: (context, index, realIndex) {
            return InkWell(
              onTap: () {
                runIfConnected(
                  context: context,
                  onConnected: () {
                    GoRouter.of(context).push(
                      AppRouter.newsDetailsView,
                      extra: widget.newsData[index],
                    );
                  },
                );
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl:
                          EndPoints.baserUrl + widget.newsData[index].image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                      placeholder: (context, url) => const ImageLoadingEffect(),
                      errorWidget: (context, url, error) => const SizedBox(),
                    ),
                  ),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.greenColor.withValues(alpha: 0.7),
                          AppColors.greenColor.withValues(alpha: 0.5),
                          AppColors.greenColor.withValues(alpha: 0.4),

                        ],
                        begin: AlignmentDirectional.centerStart,
                        end: AlignmentDirectional.centerEnd,
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    start: 16,
                    top: 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isArabic(context)
                              ? widget.newsData[index].title
                              : widget.newsData[index].title,
                          style: AppStyles.styleBold20(
                            context,
                          ).copyWith(color: AppColors.lightGreyColor),
                        ),
                        // const VerticalSpace(96),
                        // SecondaryButton(
                        //   text:" AppStrings.shopNow.tr()",
                        //   onPressed: () {
                        //     runIfConnected(
                        //       context: context,
                        //       onConnected: () {
                        //         openUrl(
                        //           context,
                        //           widget.bannerData[index].url ??
                        //               EndPoints.siteUrl,
                        //         );
                        //       },
                        //     );
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 2,
            enableInfiniteScroll: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        const VerticalSpace(12),
        // DotsIndicator(
        //   categories: widget.bannerData,
        //   currentIndex: currentIndex,
        // ),
      ],
    );
  }
}
