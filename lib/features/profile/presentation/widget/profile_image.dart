import 'package:fayoum_club/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(radius: 48, backgroundImage: AssetImage(AppAssets.man)),
          // InkWell(
          //   onTap: () {},
          //   child: Container(
          //     height: 30,
          //     width: 30,
          //     decoration: const BoxDecoration(
          //       color: Colors.blueGrey,
          //       borderRadius: BorderRadius.all(Radius.circular(30.0)),
          //     ),
          //     child: const Icon(Icons.edit_rounded,
          //         size: 15, color: Colors.white),
          //   ),
          // ),
        ],
      ),
    );
  }
}
