import 'package:fayoum_club/core/routes/app_router.dart';
import 'package:fayoum_club/core/services/service_locator.dart';
import 'package:fayoum_club/core/state_management/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:fayoum_club/features/payment/data/models/payment_process_request_model.dart';
import 'package:fayoum_club/features/payment/presentation/manager/payment_process_cubit/payment_process_cubit.dart';
import 'package:fayoum_club/features/payment/presentation/manager/payment_process_cubit/payment_process_state.dart';
import 'package:fayoum_club/features/payment/presentation/widgets/success_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SuccessView extends StatelessWidget {
  final PaymentProcessRequestModel paymentProcessRequestModel;

  const SuccessView({super.key, required this.paymentProcessRequestModel});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        context.read<BottomNavigationBarCubit>().changeIndex(0);
        GoRouter.of(context).go(AppRouter.homePage);
      },
      child: Scaffold(
        body: BlocProvider(
          create: (_) => getIt<PaymentProcessCubit>()
            ..sendPaymentProcessData(requestModel: paymentProcessRequestModel),
          child: BlocBuilder<PaymentProcessCubit, PaymentProcessState>(
            builder: (context, state) {
              if (state is PaymentProcessLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PaymentProcessSuccess) {
                return SuccessViewBody(
                  transactionId: paymentProcessRequestModel.transactionId,
                  amount: paymentProcessRequestModel.amount.toString(),
                );
              } else if (state is PaymentProcessFailure) {
                return Center(
                  child: Text(
                    state.failure.status,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
