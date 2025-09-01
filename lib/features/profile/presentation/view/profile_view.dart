// import 'package:easy_localization/easy_localization.dart';
// import 'package:fayoum_club/core/constants/app_strings.dart';
// import 'package:fayoum_club/core/widgets/app_app_bars.dart';
// import 'package:fayoum_club/features/profile/presentation/manger/delete_account_cubit/delete_account_cubit.dart';
// import 'package:fayoum_club/features/profile/presentation/widget/delete_account_button.dart';
// import 'package:fayoum_club/features/profile/presentation/widget/delete_account_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/services/service_locator.dart';
// import '../widget/profile_section.dart';
//
// class ProfileView extends StatelessWidget {
//   const ProfileView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PrimaryAppBar(title: AppStrings.profile.tr()),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           children: [
//             const Spacer(),
//             const ProfileSection(),
//             const Spacer(flex: 6),
//             DeleteAccountButton(
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) => BlocProvider(
//                     create: (_) => getIt<DeleteAccountCubit>(),
//                     child: const DeleteAccountDialog(),
//                   ),
//                 );
//               },
//             ),
//             const Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }
