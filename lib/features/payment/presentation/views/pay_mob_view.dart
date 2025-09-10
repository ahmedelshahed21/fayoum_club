import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/core/utils/app_strings.dart';
import 'package:fayoum_club/core/databases/cache/user_data_manager.dart';
import 'package:fayoum_club/core/functions/app_snack_bars.dart';
import 'package:fayoum_club/core/routes/app_router.dart';
import 'package:fayoum_club/core/services/service_locator.dart';
import 'package:fayoum_club/features/activites/data/models/activity_details_model/activity_details_model.dart';
import 'package:fayoum_club/features/payment/data/models/payment_process_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/data/repos/pay_mob_repo/pay_mob_repo.dart';

class PayMobView extends StatefulWidget {
  const PayMobView({super.key, required this.activityDetailsData});

  final ActivityDetailsData activityDetailsData;

  @override
  PayMobViewState createState() => PayMobViewState();
}

class PayMobViewState extends State<PayMobView> {
  late InAppWebViewController _webViewController;
  bool _isLoading = true;
  static const String kCallbackUrl = "https://accept.paymobsolutions.com";
  late PaymentProcessRequestModel paymentProcessRequestModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri('about:blank')),
            onWebViewCreated: (controller) {
              _webViewController = controller;
              redirectedSnackBar(
                context,
                message: AppStrings.redirectToPaymentPage.tr(),
              );
              _pay();
            },
            onLoadStop: (controller, url) async {
              setState(() => _isLoading = false);

              if (url == null) return;

              final urlString = url.toString();

              if (urlString.startsWith(kCallbackUrl) &&
                  urlString.contains('success=true')) {
                Uri uri = Uri.parse(urlString);

                String? transactionId =
                    uri.queryParameters['transaction_id'] ??
                    uri.queryParameters['id'];
                if (transactionId == null || transactionId.isEmpty) {
                  final fragmentParams = Uri.splitQueryString(uri.fragment);
                  transactionId = fragmentParams['transaction_id'];
                }

                if (transactionId != null && transactionId.isNotEmpty) {
                  await _onPaymentSuccess(transactionId);
                }
              }
            },
          ),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  Future<void> _pay() async {
    try {
      final UserDataManager userData = getIt<UserDataManager>();
      int amount = 0;

      if (userData.getUserMembership() != null) {
        amount = widget.activityDetailsData.moneyMember;
      } else {
        amount = widget.activityDetailsData.money;
      }
      String paymentKey = await PayMobRepo().getPaymentKey(amount, "EGP", "df");
      String url =
          "https://accept.paymob.com/api/acceptance/iframes/896654?payment_token=$paymentKey";
      await _webViewController.loadUrl(
        urlRequest: URLRequest(url: WebUri(url)),
      );
    } catch (e) {
      debugPrint("Error in payment: $e");
    }
  }

  Future<void> _onPaymentSuccess(String transactionId) async {
    final UserDataManager userData = getIt<UserDataManager>();
    int amount = 0;

    if (userData.getUserMembership() != null) {
      amount = widget.activityDetailsData.moneyMember;
    } else {
      amount = widget.activityDetailsData.money;
    }
    paymentProcessRequestModel = PaymentProcessRequestModel(
      activityId: widget.activityDetailsData.id,
      transactionId: transactionId,
      amount: amount,
    );

    GoRouter.of(
      context,
    ).push(AppRouter.successView, extra: paymentProcessRequestModel);
  }
}
