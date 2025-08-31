import 'package:flutter/material.dart';
import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/filter_option_chip.dart';

class FilterSection extends StatefulWidget {
  final String title;
  final List<Map<String, String>> options;
  final ValueChanged<String?> onOptionSelected;
  final Color selectedChipColor;

  const FilterSection({
    super.key,
    required this.title,
    required this.options,
    required this.onOptionSelected,
    required this.selectedChipColor,
  });

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppStyles.styleBold18(
            context,
          ).copyWith(color: AppColors.pureBlackColor),
        ),
        const VerticalSpace(4),
        Wrap(
          spacing: 4,
          children:
              widget.options.map((option) {
                final displayName = option["key"] ?? "";
                final value = option["value"] ?? "";

                return FilterOptionChip(
                  label: displayName,
                  isSelected: selectedValue == value,
                  selectedChipColor: widget.selectedChipColor,
                  onTap: () {
                    setState(() {
                      if (selectedValue == value) {
                        selectedValue = null;
                      } else {
                        selectedValue = value;
                      }
                    });
                    widget.onOptionSelected(selectedValue);
                  },
                );
              }).toList(),
        ),
        const VerticalSpace(8),
      ],
    );
  }
}
