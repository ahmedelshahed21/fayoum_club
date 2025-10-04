import 'package:fayoum_club/core/functions/dummy_lists.dart';
import 'package:fayoum_club/core/widgets/retry_widget.dart';
import 'package:fayoum_club/features/home/presentation/manager/banners_cubit/banners_cubit.dart';
import 'package:fayoum_club/features/news/presentation/manager/news_cubit/news_cubit.dart';
import 'package:fayoum_club/features/news/presentation/manager/news_cubit/news_state.dart';
import 'package:fayoum_club/features/news/presentation/widgets/categorized_news_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';


class CategorizedNewsSliverListSection extends StatefulWidget {
  const CategorizedNewsSliverListSection({super.key, required this.activityId});
  final int activityId;

  @override
  State<CategorizedNewsSliverListSection> createState() => _CategorizedNewsSliverListSectionState();
}

class _CategorizedNewsSliverListSectionState extends State<CategorizedNewsSliverListSection> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().fetchNews(activityId: widget.activityId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return Skeletonizer.sliver(
            textBoneBorderRadius: TextBoneBorderRadius(
              BorderRadius.circular(4),
            ),
            child: CategorizedNewsSliverList(
              news: getDummyNews(),
              hasMore: false,
            ),
          );
        } else if (state is NewsFailure) {
          return SliverToBoxAdapter(
            child: RetryWidget(
              message: state.failure.errMessage,
              onPressed: () {
                context.read<BannersCubit>().getBanners();
                context.read<NewsCubit>().fetchNews(refresh: true,activityId: widget.activityId);
              },
            ),
          );
        } else if (state is NewsSuccess) {
          return CategorizedNewsSliverList(
            news: state.news,
            hasMore: state.hasMore,
          );
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}