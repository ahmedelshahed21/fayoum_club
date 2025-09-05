import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/news/data/models/news_model.dart';
import 'package:fayoum_club/features/news/presentation/widgets/news_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class NewsSliverList extends StatelessWidget {
  final List<NewsItem> news;

  const NewsSliverList({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        Text(
          'الأخبار',
          style: AppStyles.styleSemiBold16(
            context,
          ).copyWith(color: AppColors.pureBlackColor),
        ),
        VerticalSpace(8),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: news.length,
            (context, index) => NewsTile(news: news[index]),
          ),
        ),
      ],
    );
  }
}
