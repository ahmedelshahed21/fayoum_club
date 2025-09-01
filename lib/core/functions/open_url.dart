import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/core/functions/app_snack_bars.dart';
import 'package:flutter/material.dart';
import 'package:fayoum_club/core/constants/app_strings.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(BuildContext context, String url) async {
  final Uri uri = Uri.parse(url);
  final canLaunch = await canLaunchUrl(uri);

  if (!canLaunch) {
    if (!context.mounted) return;
    primarySnackBar(context, AppStrings.unexpectedError.tr());
    return;
  }

  await launchUrl(uri);
}
