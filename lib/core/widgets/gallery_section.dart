import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'image_preview_and_gallery.dart';

class GallerySection extends StatelessWidget {
  final List<String> galleryImage;

  const GallerySection({
    super.key,
    required this.galleryImage,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            shadowColor: AppColors.lightGreyColor,
            color: AppColors.pureWhiteColor,
            elevation: 0,
            child: ImagePreviewAndGallery(
              galleryWithThumbnail: galleryImage,
            ),
          ),
        ],
      ),
    );
  }
}
