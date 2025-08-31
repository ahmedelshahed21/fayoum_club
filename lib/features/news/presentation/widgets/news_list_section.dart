import 'package:fayoum_club/core/functions/dummy_lists.dart';
import 'package:fayoum_club/core/widgets/retry_widget.dart';
import 'package:fayoum_club/features/news/presentation/manager/news_cubit/news_cubit.dart';
import 'package:fayoum_club/features/news/presentation/manager/news_cubit/news_state.dart';
import 'package:fayoum_club/features/news/presentation/widgets/news_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NewsListSection extends StatelessWidget {
  const NewsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return Skeletonizer.sliver(
              textBoneBorderRadius: TextBoneBorderRadius(BorderRadius.circular(4)),
              child: NewsSliverList(news: getDummyBanners()));
        } else if (state is NewsFailure) {
          return SliverToBoxAdapter(
            child: RetryWidget(
              message: state.failure.errMessage,
              onPressed: () {
                context.read<NewsCubit>().getAllNews();
              },
            ),
          );
        } else if (state is NewsSuccess) {
          return NewsSliverList(news: state.news.data!.items);
        }
        return SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
