import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:fayoum_club/core/utils/app_strings.dart';
import 'package:fayoum_club/core/utils/app_styles.dart';
import 'package:fayoum_club/core/databases/cache/user_data_manager.dart';
import 'package:fayoum_club/core/functions/app_snack_bars.dart';
import 'package:fayoum_club/core/services/service_locator.dart';
import 'package:fayoum_club/core/state_management/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:fayoum_club/core/state_management/user_cubit/user_session_cubit.dart';
import 'package:fayoum_club/core/widgets/app_buttons.dart';
import 'package:fayoum_club/core/widgets/app_indicators.dart';
import 'package:fayoum_club/core/widgets/app_text_fields.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/more/data/models/contact_us_request_model.dart';
import 'package:fayoum_club/features/more/presentation/manager/contact_us_cubit/contact_us_cubit.dart';
import 'package:fayoum_club/features/more/presentation/manager/contact_us_cubit/contact_us_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsForm extends StatefulWidget {
  const ContactUsForm({super.key});

  @override
  State<ContactUsForm> createState() => _ContactUsForm();
}

class _ContactUsForm extends State<ContactUsForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    final user = getIt<UserDataManager>();
    _nameController.text = user.getUserName() ?? '';
    _phoneNumberController.text = user.getUserPhoneNumber() ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isGuest = context.select<UserSessionCubit, bool>(
      (cubit) => cubit.state.isGuest,
    );

    return BlocProvider(
      create: (context) => getIt<ContactUsCubit>(),
      child: BlocConsumer<ContactUsCubit, ContactUsState>(
        listener: (context, state) {
          if (state is ContactUsSuccessState) {
            context.read<BottomNavigationBarCubit>().changeIndex(0);
            primarySnackBar(
              context,
              state.contactUs.status,
              icon: Icons.check_circle_outline_outlined,
              boxColor: AppColors.greenColor,
            );
          } else if (state is ContactUsFailureState) {
            primarySnackBar(
              context,
              state.failure.message,
              icon: Icons.error_outline,
              boxColor: AppColors.redColor,
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const VerticalSpace(16),
                isGuest
                    ? Column(
                      children: [
                        SecondaryTextFormField(
                          fieldName: AppStrings.name.tr(),
                          hintText: AppStrings.name.tr(),
                          controller: _nameController,
                          textInputType: TextInputType.name,
                        ),
                        const VerticalSpace(16),
                        SecondaryTextFormField(
                          maxLength: 11,
                          fieldName: AppStrings.phoneNumber.tr(),
                          hintText: AppStrings.phoneNumber.tr(),
                          controller: _phoneNumberController,
                          textInputType: TextInputType.phone,
                        ),
                        const VerticalSpace(16),
                      ],
                    )
                    : const SizedBox.shrink(),

                SecondaryTextFormField(
                  minLines: 7,
                  maxLines: 10,
                  fieldName: 'الاستفسار',
                  hintText: AppStrings.writeHere.tr(),
                  controller: _messageController,
                  textInputType: TextInputType.text,
                ),
                const VerticalSpace(48),
                PrimaryButton(
                  onPressed: () {
                    final ContactUsRequestModel contactUsDataModel =
                        ContactUsRequestModel(
                          name: _nameController.text,
                          phoneNumber: _phoneNumberController.text,
                          message: _messageController.text,
                        );
                    FocusScope.of(context).unfocus();
                    context.read<ContactUsCubit>().contactUs(
                      contactData: contactUsDataModel,
                    );
                  },
                  child:
                      state is ContactUsLoadingState
                          ? const PrimaryCircularProgressIndicator()
                          : Text(
                            AppStrings.send.tr(),
                            style: AppStyles.styleSemiBold20(
                              context,
                            ).copyWith(color: AppColors.pureWhiteColor),
                          ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
