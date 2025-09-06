import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/features/home/data/models/banners_models/urgent_news_model.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    super.key,
    required this.news,
    required int currentIndex,
  }) : _currentIndex = currentIndex;

  final List<UrgentNewsItem> news;
  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        news.length,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: _currentIndex == index ? 16 : 8,
          height: 8,
          decoration: BoxDecoration(
            color:
            _currentIndex == index
                ? AppColors.primaryColor
                : AppColors.greyColor.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
