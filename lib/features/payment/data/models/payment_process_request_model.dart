class PaymentProcessRequestModel {
  final int activityId;
  final String transactionId;
  final int amount;


  PaymentProcessRequestModel( {
  required  this.activityId,required this.transactionId,required this.amount,
  });

  Map<String, dynamic> toJson() {
    return {
      'activiteId': activityId,
      'numberCode': transactionId,
      'monyPay': amount,

    };
  }

  factory PaymentProcessRequestModel.fromJson(Map<String, dynamic> json) {
    return PaymentProcessRequestModel(
    activityId: json['activiteId'],
      transactionId: json['numberCode'],
      amount: json['monyPay'],
    );
  }
}
