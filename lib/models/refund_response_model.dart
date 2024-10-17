class RefundResponse {
  final String operationId;
  final String documentNr;
  final double refundedAmount;
  final String rrn;
  final String stan;
  final String refundStatus;
  final String receiptText;

  RefundResponse({
    required this.operationId,
    required this.documentNr,
    required this.refundedAmount,
    required this.rrn,
    required this.stan,
    required this.refundStatus,
    required this.receiptText,
  });

  factory RefundResponse.fromJson(Map<String, dynamic> json) {
    return RefundResponse(
      operationId: json['operationId'],
      documentNr: json['documentNr'],
      refundedAmount: json['refundedAmount']?.toDouble() ?? 0.0,
      rrn: json['rrn'],
      stan: json['stan'],
      refundStatus: json['refundStatus'],
      receiptText: json['receiptText'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'operationId': operationId,
      'documentNr': documentNr,
      'refundedAmount': refundedAmount,
      'rrn': rrn,
      'stan': stan,
      'refundStatus': refundStatus,
      'receiptText': receiptText,
    };
  }
}
