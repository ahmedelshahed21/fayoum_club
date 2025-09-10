import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/databases/cache/user_data_manager.dart';
import '../../../../core/services/service_locator.dart';

class EditableProfileAvatar extends StatefulWidget {
  const EditableProfileAvatar({super.key, required this.onImageSelected});
  final Function(File?) onImageSelected;
  @override
  State<EditableProfileAvatar> createState() => _EditableProfileAvatarState();
}

class _EditableProfileAvatarState extends State<EditableProfileAvatar> {
  File? _selectedImage;
  UserDataManager userDataManager = getIt<UserDataManager>();

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });

      widget.onImageSelected(_selectedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 53,
          backgroundColor: AppColors.primaryColor,
          child: CircleAvatar(
            radius: 52,
            backgroundColor: AppColors.pureWhiteColor,
            child: CircleAvatar(
              radius: 48,
              backgroundColor: AppColors.lightGreyColor.withValues(alpha: 0.5),
              backgroundImage:
                  _selectedImage != null
                      ? FileImage(_selectedImage!)
                      : CachedNetworkImageProvider(
                            userDataManager.getUserAvatarUrl()!,
                          )
                          as ImageProvider<Object>?,
            ),
          ),
        ),
        PositionedDirectional(
          bottom: 0,
          end: 0,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              pickImage();
            },
            child: CircleAvatar(
              backgroundColor: AppColors.pureWhiteColor,
              radius: 18,
              child: CircleAvatar(
                radius: 17,
                backgroundColor: AppColors.pureWhiteColor,
                child: SvgPicture.asset(
                  AppAssets.editAvatarIcon,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
