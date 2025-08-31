import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/functions/input_border.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PrimaryTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final bool? obscureText;
  final String? Function(String? val)? validate;
  final TextInputType? type;
  final void Function(String)? onSubmit;
  final String? Function(String val)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final bool? readOnly;
  final String? svgPath;
  final void Function()? onTap;

  const PrimaryTextFormField(
      {super.key,
        this.labelText,
        this.hintText,
        this.controller,
        this.obscureText,
        this.suffixIcon,
        this.validate,
        this.type,
        this.onSubmit,
        this.onChanged,
        this.prefixIcon,
        this.maxLength,
        this.minLines,
        this.maxLines,
        this.readOnly,
        this.onTap,
        this.svgPath});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleY: 0.8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.loadingEffectColor),
          color: AppColors.pureWhiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextFormField(
          readOnly: readOnly ?? false,
          onTap: onTap,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorRadius: const Radius.circular(16),
          cursorHeight: 28,
          cursorWidth: 1.5,
          minLines: minLines,
          maxLines: maxLines,
          maxLength: maxLength,
          buildCounter: (
              context, {
                required currentLength,
                required isFocused,
                required maxLength,
              }) =>
          const SizedBox.shrink(),
          obscureText: obscureText ?? false,
          onFieldSubmitted: onSubmit,
          onChanged: onChanged,
          keyboardType: type,
          style: AppStyles.styleMedium18(
            context,
          ).copyWith(color: AppColors.pureBlackColor),
          validator: validate,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: svgPath != null
                ? Transform.scale(
                scale: 0.6,
                child: SvgPicture.asset(
                  svgPath!,
                  colorFilter: ColorFilter.mode(
                      AppColors.lightGreyColor, BlendMode.srcIn),
                ))
                : prefixIcon,
            suffixIcon: suffixIcon,
            labelText: labelText,
            labelStyle: AppStyles.styleRegular16(
              context,
            ).copyWith(color: AppColors.offGreyColor),
            hintText: hintText,
            hintStyle: AppStyles.styleRegular14(context),
          ),
          controller: controller,
        ),
      ),
    );
  }
}

class SecondaryTextFormField extends StatelessWidget {
  final String? fieldName;
  final TextStyle? fieldNameStyle;
  final String? labelText;
  final String? hintText;
  final bool? obscureText;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final bool? readOnly;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final void Function()? suffixOnPressed;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final void Function()? onTap;

  const SecondaryTextFormField({
    super.key,
    this.hintText,
    this.textInputType,
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.suffixOnPressed,
    this.obscureText,
    this.contentPadding,
    this.maxLength,
    this.controller,
    this.onTap,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.labelText,
    this.fieldName,
    this.fieldNameStyle,
    this.minLines,
    this.maxLines,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          fieldName ?? '',
          style: fieldNameStyle ?? AppStyles.styleMedium14(context),
        ),
        const VerticalSpace(6),
        TextFormField(
          onChanged: onChanged,
          onTap: onTap,
          readOnly: readOnly ?? false,
          style: AppStyles.styleRegular16(context).copyWith(
            color: AppColors.pureBlackColor,
          ),
          keyboardType: textInputType,
          obscureText: obscureText ?? false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          cursorColor: AppColors.primaryColor,
          cursorHeight: 24,
          cursorWidth: 1.5,
          minLines: minLines,
          maxLines: maxLines,
          maxLength: maxLength,
          buildCounter: (_,
              {required currentLength,
                required isFocused,
                required maxLength}) =>
          const SizedBox.shrink(),
          decoration: InputDecoration(
            labelText: labelText,
            filled: true,
            fillColor: Colors.white,
            contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            prefix: prefix,
            suffix: suffix,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            suffixIconColor: AppColors.lightGreyColor,
            hintText: hintText,
            hintStyle: AppStyles.styleMedium16(context)
                .copyWith(color: AppColors.lightGreyColor),
            enabledBorder:
            buildOutlineInputBorder(color: AppColors.lightGreyColor),
            focusedBorder: buildOutlineInputBorder(
                color: readOnly ?? false
                    ? AppColors.lightGreyColor
                    : AppColors.primaryColor,
                width: readOnly ?? false ? 1 : 1.4),
            errorBorder: buildOutlineInputBorder(color: AppColors.redColor),
            focusedErrorBorder:
            buildOutlineInputBorder(color: AppColors.redColor),
            disabledBorder:
            buildOutlineInputBorder(color: AppColors.lightGreyColor),
          ),
          controller: controller,
        ),
      ],
    );
  }
}
