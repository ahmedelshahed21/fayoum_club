import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:fayoum_club/core/utils/app_styles.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/core/databases/cache/user_data_manager.dart';
import 'package:fayoum_club/core/routes/app_router.dart';
import 'package:fayoum_club/core/services/service_locator.dart';
import 'package:fayoum_club/core/utils/app_strings.dart';
import 'package:fayoum_club/features/activities/data/models/activity_details_model/activity_details_model.dart';
import 'package:fayoum_club/features/payment/data/models/payment_process_request_model.dart';
import '../../../../core/data/repos/pay_mob_repo/pay_mob_repo.dart';

class PayMobView extends StatefulWidget {
  const PayMobView({
    super.key,
    required this.activityDetailsData,
  });

  final ActivityDetailsData activityDetailsData;

  @override
  State<PayMobView> createState() => _PayMobViewState();
}

class _PayMobViewState extends State<PayMobView> {
  late final WebViewController _webViewController;
  bool _isLoading = true;

  static const String kCallbackUrl = "https://accept.paymobsolutions.com";

  @override
  void initState() {
    super.initState();

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) => setState(() => _isLoading = false),
          onNavigationRequest: (request) {
            final url = request.url;
            if (url.startsWith(kCallbackUrl) && url.contains('success=true')) {
              _handlePaymentSuccess(url);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // redirectedSnackBar(
      //   context,
      //   message: AppStrings.redirectToPaymentPage.tr(),
      // );
      _pay();
    });
  }

  Future<void> _pay() async {
    try {
      final userData = getIt<UserDataManager>();
      int amount = userData.getUserMembership() != null
          ? widget.activityDetailsData.moneyMember
          : widget.activityDetailsData.money;

      String paymentKey = await PayMobRepo().getPaymentKey(
        amount,
        "EGP",
        "Activity Payment",
      );

      String url =
          "https://accept.paymob.com/api/acceptance/iframes/896654?payment_token=$paymentKey";

      await _webViewController.loadRequest(Uri.parse(url));
    } catch (e) {
      debugPrint("Error in payment: $e");
      // errorSnackBar(
      //   context,
      //   message: AppStrings.paymentError.tr(),
      // );
    }
  }

  Future<void> _handlePaymentSuccess(String urlString) async {
    Uri uri = Uri.parse(urlString);
    String? transactionId =
        uri.queryParameters['transaction_id'] ?? uri.queryParameters['id'];

    if (transactionId == null || transactionId.isEmpty) {
      final fragmentParams = Uri.splitQueryString(uri.fragment);
      transactionId = fragmentParams['transaction_id'];
    }

    if (transactionId != null && transactionId.isNotEmpty) {
      await _onPaymentSuccess(transactionId);
    }
  }

  Future<void> _onPaymentSuccess(String transactionId) async {
    final userData = getIt<UserDataManager>();
    int amount = userData.getUserMembership() != null
        ? widget.activityDetailsData.moneyMember
        : widget.activityDetailsData.money;

    final paymentProcessRequestModel = PaymentProcessRequestModel(
      activityId: widget.activityDetailsData.id,
      transactionId: transactionId,
      amount: amount,
    );

    GoRouter.of(context).push(
      AppRouter.successView,
      extra: paymentProcessRequestModel,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: AppColors.pureWhiteColor),
          WebViewWidget(controller: _webViewController),
          if (_isLoading)
            Container(
              color: AppColors.offWhiteColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LoadingAnimationWidget.staggeredDotsWave(
                      color: AppColors.blueColor,
                      size: 72,
                    ),
                    const VerticalSpace(32),
                    Text(
                      AppStrings.redirectToPaymentPage.tr(),
                      style: AppStyles.styleBold24(context).copyWith(
                        color: AppColors.blueColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
