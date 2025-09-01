import 'package:fayoum_club/core/functions/dummy_lists.dart';
import 'package:fayoum_club/core/widgets/retry_widget.dart';
import 'package:fayoum_club/features/activites/presentation/manager/activites_cubit/activites_cubit.dart';
import 'package:fayoum_club/features/home/presentation/manager/banners_cubit/banners_cubit.dart';
import 'package:fayoum_club/features/news/presentation/manager/news_cubit/news_cubit.dart';
import 'package:fayoum_club/features/news/presentation/manager/news_cubit/news_state.dart';
import 'package:fayoum_club/features/news/presentation/widgets/news_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NewsSliverListSection extends StatelessWidget {
  const NewsSliverListSection({super.key});

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
                context.read<BannersCubit>().getBanners();
                context.read<NewsCubit>().getAllNews();
                context.read<ActivitesCubit>().getActivites();
              },
            ),
          );
        } else if (state is NewsSuccess) {
          return NewsSliverList(news: state.news.data!);
        }
        return SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
