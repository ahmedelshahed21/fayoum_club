import 'package:fayoum_club/core/functions/run_if_connected.dart';
import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:fayoum_club/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.text,
    required this.onPressed,
    this.child,
    this.backgroundColor,
  }) : assert(text != null || child != null, 'Provide either text or child');

  final String? text;
  final Widget? child;
  final Color? backgroundColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        backgroundColor: backgroundColor ?? AppColors.primaryColor,
        foregroundColor: AppColors.offWhiteColor,
        shape: RoundedRectangleBorder(
          // side: BorderSide(
          //   color: AppColors.pureWhiteColor,
          // ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () => runIfConnected(context: context, onConnected: onPressed),
      child: FittedBox(
        child:
            child ??
            Text(
              text!,
              style: AppStyles.styleBold18(
                context,
              ).copyWith(color: AppColors.pureWhiteColor),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    this.text,
    required this.onPressed,
    this.backgroundColor,
    this.child,
    this.borderColor,
  });

  final String? text;
  final Widget? child;
  final void Function() onPressed;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.sizeOf(context).width * 0.6, 42),
        backgroundColor: backgroundColor ?? AppColors.pureWhiteColor,
        foregroundColor: AppColors.offWhiteColor,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: AppColors.primaryColor),
        ),
      ),
      onPressed: onPressed,
      child: FittedBox(
        child:
            child ??
            Text(
              text ?? '',
              style: AppStyles.styleSemiBold16(
                context,
              ).copyWith(color: AppColors.primaryColor),
            ),
      ),
    );
  }
}

class RetryButton extends StatelessWidget {
  const RetryButton({super.key, this.text, required this.onPressed, this.child})
    : assert(text != null || child != null, 'Provide either text or child');

  final String? text;
  final Widget? child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.offWhiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {
        runIfConnected(context: context, onConnected: onPressed);
      },
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child:
            child ??
            Text(
              text!,
              style: AppStyles.styleSemiBold18(
                context,
              ).copyWith(color: AppColors.pureWhiteColor),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    this.text,
    required this.onPressed,
    this.child,
    this.height,
  }) : assert(text != null || child != null, 'Provide either text or child');

  final String? text;
  final Widget? child;
  final double? height;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 256,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.offWhiteColor,
          shape: RoundedRectangleBorder(
            // side: BorderSide(
            //   color: AppColors.pureWhiteColor,
            // ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed:
            () => runIfConnected(context: context, onConnected: onPressed),
        child: FittedBox(
          child:
              child ??
              Text(
                text!,
                style: AppStyles.styleBold14(
                  context,
                ).copyWith(color: AppColors.pureWhiteColor),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.text,
    required this.onPressed,
    this.child,
    this.backgroundColor,
    this.textColor,
    this.radius,
    this.borderColor,
  }) : assert(text != null || child != null, 'Provide either text or child');

  final String? text;
  final Widget? child;
  final void Function() onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primaryColor,
        foregroundColor: AppColors.offWhiteColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(radius ?? 6),
        ),
      ),
      onPressed: onPressed,
      child: FittedBox(
        child:
            child ??
            FittedBox(
              child: Text(
                text!,
                style: AppStyles.styleSemiBold14(
                  context,
                ).copyWith(color: textColor),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
      ),
    );
  }
}

class GoButton extends StatelessWidget {
  const GoButton({
    super.key,
    this.text,
    required this.onPressed,
    this.child,
    this.backgroundColor,
  }) : assert(text != null || child != null, 'Provide either text or child');

  final String? text;
  final Widget? child;
  final Color? backgroundColor;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primaryColor,
        foregroundColor: AppColors.pureWhiteColor,
        minimumSize: const Size(double.infinity, 54),
        shadowColor: AppColors.pureWhiteColor,
        elevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      child: FittedBox(
        child:
            child ??
            Text(
              text!,
              style: AppStyles.styleBold20(
                context,
              ).copyWith(color: AppColors.pureWhiteColor),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
      ),
    );
  }
}
