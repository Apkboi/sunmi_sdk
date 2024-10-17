class VoidResponse {
  final String operationId;
  final String documentNr;
  final double voidedAmount;
  final String rrn;
  final String stan;
  final String voidStatus;
  final String receiptText;

  VoidResponse({
    required this.operationId,
    required this.documentNr,
    required this.voidedAmount,
    required this.rrn,
    required this.stan,
    required this.voidStatus,
    required this.receiptText,
  });

  factory VoidResponse.fromJson(Map<String, dynamic> json) {
    return VoidResponse(
      operationId: json['operationId'],
      documentNr: json['documentNr'],
      voidedAmount: json['voidedAmount']?.toDouble() ?? 0.0,
      rrn: json['rrn'],
      stan: json['stan'],
      voidStatus: json['voidStatus'],
      receiptText: json['receiptText'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'operationId': operationId,
      'documentNr': documentNr,
      'voidedAmount': voidedAmount,
      'rrn': rrn,
      'stan': stan,
      'voidStatus': voidStatus,
      'receiptText': receiptText,
    };
  }
}
