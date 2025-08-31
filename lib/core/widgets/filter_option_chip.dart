import 'package:flutter/material.dart';
import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';

class FilterOptionChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedChipColor;

  const FilterOptionChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.selectedChipColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? selectedChipColor.withValues(alpha: 0.8)
                  : AppColors.lightGreyColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: AppStyles.styleRegular16(
            context,
          ).copyWith(color: AppColors.pureBlackColor),
        ),
      ),
    );
  }
}
