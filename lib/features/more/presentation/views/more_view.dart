import 'package:fayoum_club/core/state_management/user_cubit/user_session_cubit.dart';
import 'package:fayoum_club/core/widgets/guest_circle_avatar.dart';
import 'package:fayoum_club/features/more/presentation/widgets/account_section.dart';
import 'package:fayoum_club/features/more/presentation/widgets/help_section.dart';
import 'package:fayoum_club/features/more/presentation/widgets/logout_section.dart';
import 'package:fayoum_club/features/more/presentation/widgets/more_view_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/spacing.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isGuest =
        context.select<UserSessionCubit, bool>((cubit) => cubit.state.isGuest);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const VerticalSpace(16),
            isGuest ? const GuestCircleAvatar() : const MoreViewHeader(),
            isGuest ? const SizedBox.shrink() : const VerticalSpace(64),
            isGuest ? const SizedBox.shrink() :  const AccountSection(),
            // const VerticalSpace(16),
            // const SettingsSection(),
            const VerticalSpace(16),
            const HelpSection(),
            // const VerticalSpace(16),
            // const AboutSection(),
            const VerticalSpace(16),
            const LogoutSection(),
            // const VerticalSpace(24),
          ],
        ),
      ),
    );
  }
}


