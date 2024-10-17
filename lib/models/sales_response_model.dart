
class SaleResponseModel {
  final dynamic operationId;
  final dynamic cryptogram;
  final dynamic documentNr;
  final int amountAuthorized;
  final int amountAdditional;
  final dynamic authCode;
  final dynamic rrn;
  final dynamic stan;
  final dynamic cardType;
  final dynamic state;
  final List<String> cvmApplied;
  final dynamic receiptText;
  final dynamic actionCode;
  final dynamic cardPAN;
  final String cardName;
  final List<String> amountAdditionalField;
  final dynamic dccStatus;

  SaleResponseModel({
    required this.operationId,
    required this.cryptogram,
    required this.documentNr,
    required this.amountAuthorized,
    required this.amountAdditional,
    required this.authCode,
    required this.rrn,
    required this.stan,
    required this.cardType,
    required this.state,
    required this.cvmApplied,
    required this.receiptText,
    required this.actionCode,
    required this.cardPAN,
    required this.cardName,
    required this.amountAdditionalField,
    required this.dccStatus,
  });

  factory SaleResponseModel.fromJson(Map<String, dynamic> json) {
    return SaleResponseModel(
      operationId: json['operationId'],
      cryptogram: json['cryptogram'],
      documentNr: json['documentNr'],
      amountAuthorized: json['amountAuthorized'],
      amountAdditional: json['amountAdditional'],
      authCode: json['authCode'],
      rrn: json['RRN'],
      stan: json['STAN'],
      cardType: json['cardType'],
      state: json['state'],
      cvmApplied: List<String>.from(json['CVMApplied']),
      receiptText: json['receiptText'],
      actionCode: json['actionCode'],
      cardPAN: json['cardPAN'],
      cardName: json['cardName'],
      amountAdditionalField: List<String>.from(json['amountAdditionalField']),
      dccStatus: json['DCCStatus'],
    );
  }
}

class AmountAdditional {
  final String type;
  final int value;

  AmountAdditional({required this.type, required this.value});

  factory AmountAdditional.fromJson(Map<String, dynamic> json) {
    return AmountAdditional(
      type: json['type'],
      value: json['value'],
    );
  }
}


