import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/functions/dummy_lists.dart';
import 'package:fayoum_club/core/services/service_locator.dart';
import 'package:fayoum_club/core/widgets/retry_widget.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/news/data/models/news_model.dart';
import 'package:fayoum_club/features/news/presentation/manager/news_cubit/news_cubit.dart';
import 'package:fayoum_club/features/news/presentation/manager/news_cubit/news_state.dart';
import 'package:fayoum_club/features/news/presentation/widgets/categorized_news_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RelatedNewsSection extends StatelessWidget {
  const RelatedNewsSection({
    super.key,
    required this.news,
  });

  final NewsItem news;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> getIt<NewsCubit>()..fetchNews(status: news.status,typeOption: news.typeOption,activityId: news.activate!.id),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return Skeletonizer(
              textBoneBorderRadius: TextBoneBorderRadius(
                BorderRadius.circular(4),
              ),
              containersColor: AppColors.loadingEffectColor,
              child: Column(
                children: getDummyNews()
                    .map((e)=> CategorizedNewsTile(news: e)
                ).toList()
              ),
            );
          } else if (state is NewsFailure) {
            return RetryWidget(
              message: state.failure.errMessage,
              onPressed: () {
                context
                    .read<NewsCubit>()
                    .fetchNews(refresh: true);
              },
            );
          }
          else if (state is NewsSuccess) {
            if (state.news.isEmpty) {
              return const SizedBox.shrink();
            }

            final relatedNews =
            state.news.where((item) => item.id != news.id).toList();

            if (relatedNews.isEmpty) {
              return const SizedBox.shrink();
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'أخبار ذات صلة',
                  style: AppStyles.styleSemiBold16(context)
                      .copyWith(color: AppColors.pureBlackColor),
                ),
                const VerticalSpace(12),
                Column(
                  children: relatedNews
                      .map((item) => CategorizedNewsTile(news: item))
                      .toList(),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}