import 'package:fayoum_club/core/functions/internet_connection_status_snack_bar.dart';
import 'package:fayoum_club/core/state_management/network_connection_cubit/network_connection_cubit.dart';
import 'package:fayoum_club/core/state_management/network_connection_cubit/network_connection_state.dart';
import 'package:fayoum_club/core/widgets/app_indicators.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/home/presentation/manager/activites_cubit/activites_cubit.dart';
import 'package:fayoum_club/features/home/presentation/manager/banners_cubit/banners_cubit.dart';
import 'package:fayoum_club/features/home/presentation/widgets/banners_section.dart';
import 'package:fayoum_club/features/home/presentation/widgets/activites_horizontal_list_view_section.dart';
import 'package:fayoum_club/features/news/presentation/manager/news_cubit/news_cubit.dart';
import 'package:fayoum_club/features/news/presentation/widgets/news_list_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkConnectionCubit, NetworkConnectionState>(
      listener: (context, state) {
        if (state is NetworkConnected) {
          internetConnectionStatusSnackBar(context, isConnected: true);
        } else if (state is NetworkDisconnected) {
          internetConnectionStatusSnackBar(context, isConnected: false);
        }
      },
      // builder: (context, state) {
      //   if (state is NetworkDisconnected) {
      //     return Center(
      //       child: NoInternetConnectionContainer(
      //         message: AppStrings.noInternetConnection.tr(),
      //       ),
      //     );
      //   }
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: PrimaryRefreshIndicator(
          onRefresh: () async {
            context.read<BannersCubit>().getBanners();
            context.read<ActivitesCubit>().getActivites();
            context.read<NewsCubit>().getAllNews();
          },
          child: CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VerticalSpace(24),
                    const BannersSection(),
                    const VerticalSpace(12),
                    ActivitesHorizontalListViewSection(),
                    const VerticalSpace(8),
                  ],
                ),
              ),
              SliverToBoxAdapter(child: const VerticalSpace(24)),
              NewsListSection()
            ],
          ),
        ),
      ),
    );
  }
}
