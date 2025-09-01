import 'package:fayoum_club/core/functions/app_snack_bars.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openCallUrl(
  BuildContext context,
  String phoneCode,
  String phone,
) async {
  final rawNumber = '$phoneCode$phone';
  final telNumber = rawNumber.replaceAll(' ', '');
  final uri = Uri(scheme: 'tel', path: telNumber);
  try {
    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched) {
      throw 'Could not launch dialer';
    }
  } catch (e) {
    if (context.mounted) {
      primarySnackBar(context, 'تعذّر فتح تطبيق الاتصال');
    }
  }
}
