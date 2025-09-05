import 'package:fayoum_club/core/functions/dummy_lists.dart';
import 'package:fayoum_club/features/home/presentation/manager/banners_cubit/banners_cubit.dart';
import 'package:fayoum_club/features/home/presentation/manager/banners_cubit/banners_state.dart';
import 'package:fayoum_club/features/home/presentation/widgets/banners_sliders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BannersSection extends StatelessWidget {
  const BannersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannersCubit, BannersState>(
      builder: (context, state) {
        if (state is BannersLoading) {
          return Skeletonizer(
            child: BannersSliders(newsData: getDummyBanners()),
          );
        } else if (state is BannersFailure) {
          return SizedBox.shrink();
        } else if (state is BannersSuccess) {
          return BannersSliders(newsData: state.bannersModel.data!);
        }
        return const SizedBox();
      },
    );
  }
}
