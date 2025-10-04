import 'package:cached_network_image/cached_network_image.dart';
import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:fayoum_club/core/utils/end_points.dart';
import 'package:fayoum_club/core/widgets/back_icon_button.dart';
import 'package:fayoum_club/core/widgets/image_loading_effect.dart';
import 'package:flutter/material.dart';

class ActivityDetailsHeaderSection extends StatelessWidget {
  const ActivityDetailsHeaderSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: EndPoints.baserUrl + image,
          width: double.infinity,
          height: 220,
          fit: BoxFit.cover,
          placeholder: (context, url) => const ImageLoadingEffect(),
          errorWidget:
              (context, url, error) => Container(
                color: Colors.grey.shade300,
                width: double.infinity,
                height: 220,
                child: const Icon(Icons.broken_image, size: 40),
              ),
        ),
        Positioned(
          left: 16,
          top: 16,
          child: CircleAvatar(
            radius: 26,
            backgroundColor: AppColors.pureWhiteColor.withValues(alpha: 0.8),
            child: BackIconButton(iconColor: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
