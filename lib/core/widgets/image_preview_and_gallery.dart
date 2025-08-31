import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'image_loading_effect.dart';

class ImagePreviewAndGallery extends StatefulWidget {
  const ImagePreviewAndGallery({super.key, required this.galleryWithThumbnail});
  final List<String> galleryWithThumbnail;
  @override
  State<ImagePreviewAndGallery> createState() => _ImagePreviewAndGallery();
}

class _ImagePreviewAndGallery extends State<ImagePreviewAndGallery> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 264,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            itemCount: widget.galleryWithThumbnail.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: widget.galleryWithThumbnail[index],
                  fit: BoxFit.fill,
                  placeholder: (context, url) => const ImageLoadingEffect(),
                  errorWidget: (context, url, error) => Container(),
                ),
              );
            },
          ),
        ),
        const VerticalSpace(24),
        Center(
          child: SizedBox(
            height: 64,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: widget.galleryWithThumbnail.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                      setState(() {
                        currentIndex = index;
                      });
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color:
                            currentIndex == index
                                ? AppColors.primaryColor
                                : Colors.transparent,
                        width: 2.5,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.5),
                      child: CachedNetworkImage(
                        width: 64,
                        height: 64,
                        imageUrl: widget.galleryWithThumbnail[index],
                        fit: BoxFit.cover,
                        placeholder:
                            (context, url) => const ImageLoadingEffect(),
                        errorWidget: (context, url, error) => Container(),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const HorizontalSpace(12);
              },
            ),
          ),
        ),
        const VerticalSpace(12),
      ],
    );
  }
}
