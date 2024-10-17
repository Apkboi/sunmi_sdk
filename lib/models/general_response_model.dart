class GeneralResponse {
  final String operationId;
  final String documentNr;
  final String rrn;
  final String stan;
  final String status;
  final String receiptText;

  GeneralResponse({
    required this.operationId,
    required this.documentNr,
    required this.rrn,
    required this.stan,
    required this.status,
    required this.receiptText,
  });

  factory GeneralResponse.fromJson(Map<String, dynamic> json) {
    return GeneralResponse(
      operationId: json['operationId'],
      documentNr: json['documentNr'],
      rrn: json['rrn'],
      stan: json['stan'],
      status: json['status'],
      receiptText: json['receiptText'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'operationId': operationId,
      'documentNr': documentNr,
      'rrn': rrn,
      'stan': stan,
      'status': status,
      'receiptText': receiptText,
    };
  }
}
