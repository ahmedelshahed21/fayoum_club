import 'package:fayoum_club/core/widgets/icon_in_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/spacing.dart';


class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget({
    super.key,
    required this.title,
    this.iconData,
    this.svgPath,
    required this.onPressed,
  }) : assert(
  iconData != null || svgPath != null,
  'Provide either iconData or svgPath',
  );

  final String title;
  final IconData? iconData;
  final String? svgPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.pureWhiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: AppColors.pureBlackColor.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              IconInBoxWidget(
                child: iconData != null
                    ? Icon(iconData, color: AppColors.primaryColor)
                    : SvgPicture.asset(
                  svgPath!,
                  height: 22,
                  colorFilter:  ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const HorizontalSpace(16),
              Expanded(
                child: Text(
                  title,
                  style: AppStyles.styleRegular16(context).copyWith(
                    color: AppColors.offGreyColor,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: AppColors.primaryColor.withValues(alpha: 0.6),
              ),
            ],
          ),
        ),
      ),
    );
  }


}

