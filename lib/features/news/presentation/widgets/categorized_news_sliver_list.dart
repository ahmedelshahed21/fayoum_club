import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/widgets/app_indicators.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/news/data/models/news_model.dart';
import 'package:fayoum_club/features/news/presentation/widgets/categorized_news_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class CategorizedNewsSliverList extends StatelessWidget {
  final List<NewsItem> news;
  final bool hasMore;
  final ScrollController? scrollController;

  const CategorizedNewsSliverList({
    super.key,
    required this.news,
    required this.hasMore,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return news.isNotEmpty ? MultiSliver(
      children: [
        Text(
          'الأخبار',
          style: AppStyles.styleSemiBold16(context).copyWith(
            color: AppColors.pureBlackColor,
          ),
        ),
        VerticalSpace(12),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: hasMore ? news.length + 1 : news.length,
                (context, index) {
              if (index < news.length) {
                return CategorizedNewsTile(news: news[index]);
              } else {
                return  Padding(
                  padding: EdgeInsets.all(8),
                  child: Center(child: PrimaryCircularProgressIndicator(color: AppColors.primaryColor)),
                );
              }
            },
          ),
        ),
      ],
    ):SliverToBoxAdapter(child: SizedBox.shrink());
  }
}

