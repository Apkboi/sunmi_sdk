// Autogenerated from Pigeon (v22.5.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import "SunmiSdk.h"

#if TARGET_OS_OSX
#import <FlutterMacOS/FlutterMacOS.h>
#else
#import <Flutter/Flutter.h>
#endif

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSArray<id> *wrapResult(id result, FlutterError *error) {
  if (error) {
    return @[
      error.code ?: [NSNull null], error.message ?: [NSNull null], error.details ?: [NSNull null]
    ];
  }
  return @[ result ?: [NSNull null] ];
}

static id GetNullableObjectAtIndex(NSArray<id> *array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}

@interface SaleRequest ()
+ (SaleRequest *)fromList:(NSArray<id> *)list;
+ (nullable SaleRequest *)nullableFromList:(NSArray<id> *)list;
- (NSArray<id> *)toList;
@end

@interface SaleResponse ()
+ (SaleResponse *)fromList:(NSArray<id> *)list;
+ (nullable SaleResponse *)nullableFromList:(NSArray<id> *)list;
- (NSArray<id> *)toList;
@end

@interface RefundRequest ()
+ (RefundRequest *)fromList:(NSArray<id> *)list;
+ (nullable RefundRequest *)nullableFromList:(NSArray<id> *)list;
- (NSArray<id> *)toList;
@end

@interface VoidRequest ()
+ (VoidRequest *)fromList:(NSArray<id> *)list;
+ (nullable VoidRequest *)nullableFromList:(NSArray<id> *)list;
- (NSArray<id> *)toList;
@end

@interface CloseDocumentRequest ()
+ (CloseDocumentRequest *)fromList:(NSArray<id> *)list;
+ (nullable CloseDocumentRequest *)nullableFromList:(NSArray<id> *)list;
- (NSArray<id> *)toList;
@end

@interface RefundResponse ()
+ (RefundResponse *)fromList:(NSArray<id> *)list;
+ (nullable RefundResponse *)nullableFromList:(NSArray<id> *)list;
- (NSArray<id> *)toList;
@end

@interface VoidResponse ()
+ (VoidResponse *)fromList:(NSArray<id> *)list;
+ (nullable VoidResponse *)nullableFromList:(NSArray<id> *)list;
- (NSArray<id> *)toList;
@end

@implementation SaleRequest
+ (instancetype)makeWithAmount:(nullable NSNumber *)amount
    currencyCode:(nullable NSString *)currencyCode
    documentNr:(nullable NSString *)documentNr {
  SaleRequest* pigeonResult = [[SaleRequest alloc] init];
  pigeonResult.amount = amount;
  pigeonResult.currencyCode = currencyCode;
  pigeonResult.documentNr = documentNr;
  return pigeonResult;
}
+ (SaleRequest *)fromList:(NSArray<id> *)list {
  SaleRequest *pigeonResult = [[SaleRequest alloc] init];
  pigeonResult.amount = GetNullableObjectAtIndex(list, 0);
  pigeonResult.currencyCode = GetNullableObjectAtIndex(list, 1);
  pigeonResult.documentNr = GetNullableObjectAtIndex(list, 2);
  return pigeonResult;
}
+ (nullable SaleRequest *)nullableFromList:(NSArray<id> *)list {
  return (list) ? [SaleRequest fromList:list] : nil;
}
- (NSArray<id> *)toList {
  return @[
    self.amount ?: [NSNull null],
    self.currencyCode ?: [NSNull null],
    self.documentNr ?: [NSNull null],
  ];
}
@end

@implementation SaleResponse
+ (instancetype)makeWithStatus:(nullable NSString *)status
    message:(nullable NSString *)message {
  SaleResponse* pigeonResult = [[SaleResponse alloc] init];
  pigeonResult.status = status;
  pigeonResult.message = message;
  return pigeonResult;
}
+ (SaleResponse *)fromList:(NSArray<id> *)list {
  SaleResponse *pigeonResult = [[SaleResponse alloc] init];
  pigeonResult.status = GetNullableObjectAtIndex(list, 0);
  pigeonResult.message = GetNullableObjectAtIndex(list, 1);
  return pigeonResult;
}
+ (nullable SaleResponse *)nullableFromList:(NSArray<id> *)list {
  return (list) ? [SaleResponse fromList:list] : nil;
}
- (NSArray<id> *)toList {
  return @[
    self.status ?: [NSNull null],
    self.message ?: [NSNull null],
  ];
}
@end

@implementation RefundRequest
+ (instancetype)makeWithRefundAmount:(nullable NSNumber *)refundAmount
    currencyCode:(nullable NSString *)currencyCode
    documentNr:(nullable NSString *)documentNr
    stan:(nullable NSString *)stan
    transactionDate:(nullable NSString *)transactionDate
    rrn:(nullable NSString *)rrn
    skipReceiptPrint:(nullable NSNumber *)skipReceiptPrint
    skipCustomerReceiptPrint:(nullable NSNumber *)skipCustomerReceiptPrint {
  RefundRequest* pigeonResult = [[RefundRequest alloc] init];
  pigeonResult.refundAmount = refundAmount;
  pigeonResult.currencyCode = currencyCode;
  pigeonResult.documentNr = documentNr;
  pigeonResult.stan = stan;
  pigeonResult.transactionDate = transactionDate;
  pigeonResult.rrn = rrn;
  pigeonResult.skipReceiptPrint = skipReceiptPrint;
  pigeonResult.skipCustomerReceiptPrint = skipCustomerReceiptPrint;
  return pigeonResult;
}
+ (RefundRequest *)fromList:(NSArray<id> *)list {
  RefundRequest *pigeonResult = [[RefundRequest alloc] init];
  pigeonResult.refundAmount = GetNullableObjectAtIndex(list, 0);
  pigeonResult.currencyCode = GetNullableObjectAtIndex(list, 1);
  pigeonResult.documentNr = GetNullableObjectAtIndex(list, 2);
  pigeonResult.stan = GetNullableObjectAtIndex(list, 3);
  pigeonResult.transactionDate = GetNullableObjectAtIndex(list, 4);
  pigeonResult.rrn = GetNullableObjectAtIndex(list, 5);
  pigeonResult.skipReceiptPrint = GetNullableObjectAtIndex(list, 6);
  pigeonResult.skipCustomerReceiptPrint = GetNullableObjectAtIndex(list, 7);
  return pigeonResult;
}
+ (nullable RefundRequest *)nullableFromList:(NSArray<id> *)list {
  return (list) ? [RefundRequest fromList:list] : nil;
}
- (NSArray<id> *)toList {
  return @[
    self.refundAmount ?: [NSNull null],
    self.currencyCode ?: [NSNull null],
    self.documentNr ?: [NSNull null],
    self.stan ?: [NSNull null],
    self.transactionDate ?: [NSNull null],
    self.rrn ?: [NSNull null],
    self.skipReceiptPrint ?: [NSNull null],
    self.skipCustomerReceiptPrint ?: [NSNull null],
  ];
}
@end

@implementation VoidRequest
+ (instancetype)makeWithOperationId:(nullable NSString *)operationId
    partialVoidAmount:(nullable NSNumber *)partialVoidAmount
    skipReceiptPrint:(nullable NSNumber *)skipReceiptPrint
    skipCustomerReceiptPrint:(nullable NSNumber *)skipCustomerReceiptPrint {
  VoidRequest* pigeonResult = [[VoidRequest alloc] init];
  pigeonResult.operationId = operationId;
  pigeonResult.partialVoidAmount = partialVoidAmount;
  pigeonResult.skipReceiptPrint = skipReceiptPrint;
  pigeonResult.skipCustomerReceiptPrint = skipCustomerReceiptPrint;
  return pigeonResult;
}
+ (VoidRequest *)fromList:(NSArray<id> *)list {
  VoidRequest *pigeonResult = [[VoidRequest alloc] init];
  pigeonResult.operationId = GetNullableObjectAtIndex(list, 0);
  pigeonResult.partialVoidAmount = GetNullableObjectAtIndex(list, 1);
  pigeonResult.skipReceiptPrint = GetNullableObjectAtIndex(list, 2);
  pigeonResult.skipCustomerReceiptPrint = GetNullableObjectAtIndex(list, 3);
  return pigeonResult;
}
+ (nullable VoidRequest *)nullableFromList:(NSArray<id> *)list {
  return (list) ? [VoidRequest fromList:list] : nil;
}
- (NSArray<id> *)toList {
  return @[
    self.operationId ?: [NSNull null],
    self.partialVoidAmount ?: [NSNull null],
    self.skipReceiptPrint ?: [NSNull null],
    self.skipCustomerReceiptPrint ?: [NSNull null],
  ];
}
@end

@implementation CloseDocumentRequest
+ (instancetype)makeWithDocumentNr:(nullable NSString *)documentNr
    operationIdList:(nullable NSArray<NSString *> *)operationIdList
    skipReceiptPrint:(nullable NSNumber *)skipReceiptPrint
    skipCustomerReceiptPrint:(nullable NSNumber *)skipCustomerReceiptPrint {
  CloseDocumentRequest* pigeonResult = [[CloseDocumentRequest alloc] init];
  pigeonResult.documentNr = documentNr;
  pigeonResult.operationIdList = operationIdList;
  pigeonResult.skipReceiptPrint = skipReceiptPrint;
  pigeonResult.skipCustomerReceiptPrint = skipCustomerReceiptPrint;
  return pigeonResult;
}
+ (CloseDocumentRequest *)fromList:(NSArray<id> *)list {
  CloseDocumentRequest *pigeonResult = [[CloseDocumentRequest alloc] init];
  pigeonResult.documentNr = GetNullableObjectAtIndex(list, 0);
  pigeonResult.operationIdList = GetNullableObjectAtIndex(list, 1);
  pigeonResult.skipReceiptPrint = GetNullableObjectAtIndex(list, 2);
  pigeonResult.skipCustomerReceiptPrint = GetNullableObjectAtIndex(list, 3);
  return pigeonResult;
}
+ (nullable CloseDocumentRequest *)nullableFromList:(NSArray<id> *)list {
  return (list) ? [CloseDocumentRequest fromList:list] : nil;
}
- (NSArray<id> *)toList {
  return @[
    self.documentNr ?: [NSNull null],
    self.operationIdList ?: [NSNull null],
    self.skipReceiptPrint ?: [NSNull null],
    self.skipCustomerReceiptPrint ?: [NSNull null],
  ];
}
@end

@implementation RefundResponse
+ (instancetype)makeWithOperationId:(nullable NSString *)operationId
    cryptogram:(nullable NSString *)cryptogram
    documentNr:(nullable NSString *)documentNr
    amountAuthorized:(nullable NSNumber *)amountAuthorized
    amountAdditional:(nullable NSNumber *)amountAdditional
    authCode:(nullable NSString *)authCode
    rrn:(nullable NSString *)rrn
    stan:(nullable NSString *)stan
    cardType:(nullable NSString *)cardType
    state:(nullable NSString *)state
    receiptText:(nullable NSString *)receiptText
    actionCode:(nullable NSString *)actionCode {
  RefundResponse* pigeonResult = [[RefundResponse alloc] init];
  pigeonResult.operationId = operationId;
  pigeonResult.cryptogram = cryptogram;
  pigeonResult.documentNr = documentNr;
  pigeonResult.amountAuthorized = amountAuthorized;
  pigeonResult.amountAdditional = amountAdditional;
  pigeonResult.authCode = authCode;
  pigeonResult.rrn = rrn;
  pigeonResult.stan = stan;
  pigeonResult.cardType = cardType;
  pigeonResult.state = state;
  pigeonResult.receiptText = receiptText;
  pigeonResult.actionCode = actionCode;
  return pigeonResult;
}
+ (RefundResponse *)fromList:(NSArray<id> *)list {
  RefundResponse *pigeonResult = [[RefundResponse alloc] init];
  pigeonResult.operationId = GetNullableObjectAtIndex(list, 0);
  pigeonResult.cryptogram = GetNullableObjectAtIndex(list, 1);
  pigeonResult.documentNr = GetNullableObjectAtIndex(list, 2);
  pigeonResult.amountAuthorized = GetNullableObjectAtIndex(list, 3);
  pigeonResult.amountAdditional = GetNullableObjectAtIndex(list, 4);
  pigeonResult.authCode = GetNullableObjectAtIndex(list, 5);
  pigeonResult.rrn = GetNullableObjectAtIndex(list, 6);
  pigeonResult.stan = GetNullableObjectAtIndex(list, 7);
  pigeonResult.cardType = GetNullableObjectAtIndex(list, 8);
  pigeonResult.state = GetNullableObjectAtIndex(list, 9);
  pigeonResult.receiptText = GetNullableObjectAtIndex(list, 10);
  pigeonResult.actionCode = GetNullableObjectAtIndex(list, 11);
  return pigeonResult;
}
+ (nullable RefundResponse *)nullableFromList:(NSArray<id> *)list {
  return (list) ? [RefundResponse fromList:list] : nil;
}
- (NSArray<id> *)toList {
  return @[
    self.operationId ?: [NSNull null],
    self.cryptogram ?: [NSNull null],
    self.documentNr ?: [NSNull null],
    self.amountAuthorized ?: [NSNull null],
    self.amountAdditional ?: [NSNull null],
    self.authCode ?: [NSNull null],
    self.rrn ?: [NSNull null],
    self.stan ?: [NSNull null],
    self.cardType ?: [NSNull null],
    self.state ?: [NSNull null],
    self.receiptText ?: [NSNull null],
    self.actionCode ?: [NSNull null],
  ];
}
@end

@implementation VoidResponse
+ (instancetype)makeWithOperationId:(nullable NSString *)operationId
    cryptogram:(nullable NSString *)cryptogram
    documentNr:(nullable NSString *)documentNr
    amountAuthorized:(nullable NSNumber *)amountAuthorized
    amountAdditional:(nullable NSNumber *)amountAdditional
    authCode:(nullable NSString *)authCode
    rrn:(nullable NSString *)rrn
    stan:(nullable NSString *)stan
    cardType:(nullable NSString *)cardType
    state:(nullable NSString *)state
    receiptText:(nullable NSString *)receiptText {
  VoidResponse* pigeonResult = [[VoidResponse alloc] init];
  pigeonResult.operationId = operationId;
  pigeonResult.cryptogram = cryptogram;
  pigeonResult.documentNr = documentNr;
  pigeonResult.amountAuthorized = amountAuthorized;
  pigeonResult.amountAdditional = amountAdditional;
  pigeonResult.authCode = authCode;
  pigeonResult.rrn = rrn;
  pigeonResult.stan = stan;
  pigeonResult.cardType = cardType;
  pigeonResult.state = state;
  pigeonResult.receiptText = receiptText;
  return pigeonResult;
}
+ (VoidResponse *)fromList:(NSArray<id> *)list {
  VoidResponse *pigeonResult = [[VoidResponse alloc] init];
  pigeonResult.operationId = GetNullableObjectAtIndex(list, 0);
  pigeonResult.cryptogram = GetNullableObjectAtIndex(list, 1);
  pigeonResult.documentNr = GetNullableObjectAtIndex(list, 2);
  pigeonResult.amountAuthorized = GetNullableObjectAtIndex(list, 3);
  pigeonResult.amountAdditional = GetNullableObjectAtIndex(list, 4);
  pigeonResult.authCode = GetNullableObjectAtIndex(list, 5);
  pigeonResult.rrn = GetNullableObjectAtIndex(list, 6);
  pigeonResult.stan = GetNullableObjectAtIndex(list, 7);
  pigeonResult.cardType = GetNullableObjectAtIndex(list, 8);
  pigeonResult.state = GetNullableObjectAtIndex(list, 9);
  pigeonResult.receiptText = GetNullableObjectAtIndex(list, 10);
  return pigeonResult;
}
+ (nullable VoidResponse *)nullableFromList:(NSArray<id> *)list {
  return (list) ? [VoidResponse fromList:list] : nil;
}
- (NSArray<id> *)toList {
  return @[
    self.operationId ?: [NSNull null],
    self.cryptogram ?: [NSNull null],
    self.documentNr ?: [NSNull null],
    self.amountAuthorized ?: [NSNull null],
    self.amountAdditional ?: [NSNull null],
    self.authCode ?: [NSNull null],
    self.rrn ?: [NSNull null],
    self.stan ?: [NSNull null],
    self.cardType ?: [NSNull null],
    self.state ?: [NSNull null],
    self.receiptText ?: [NSNull null],
  ];
}
@end

@interface SunmiSdkPigeonCodecReader : FlutterStandardReader
@end
@implementation SunmiSdkPigeonCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 129: 
      return [SaleRequest fromList:[self readValue]];
    case 130: 
      return [SaleResponse fromList:[self readValue]];
    case 131: 
      return [RefundRequest fromList:[self readValue]];
    case 132: 
      return [VoidRequest fromList:[self readValue]];
    case 133: 
      return [CloseDocumentRequest fromList:[self readValue]];
    case 134: 
      return [RefundResponse fromList:[self readValue]];
    case 135: 
      return [VoidResponse fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface SunmiSdkPigeonCodecWriter : FlutterStandardWriter
@end
@implementation SunmiSdkPigeonCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[SaleRequest class]]) {
    [self writeByte:129];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[SaleResponse class]]) {
    [self writeByte:130];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[RefundRequest class]]) {
    [self writeByte:131];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[VoidRequest class]]) {
    [self writeByte:132];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[CloseDocumentRequest class]]) {
    [self writeByte:133];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[RefundResponse class]]) {
    [self writeByte:134];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[VoidResponse class]]) {
    [self writeByte:135];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface SunmiSdkPigeonCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation SunmiSdkPigeonCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[SunmiSdkPigeonCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[SunmiSdkPigeonCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *GetSunmiSdkCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    SunmiSdkPigeonCodecReaderWriter *readerWriter = [[SunmiSdkPigeonCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}
void SetUpSunmiSdkApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<SunmiSdkApi> *api) {
  SetUpSunmiSdkApiWithSuffix(binaryMessenger, api, @"");
}

void SetUpSunmiSdkApiWithSuffix(id<FlutterBinaryMessenger> binaryMessenger, NSObject<SunmiSdkApi> *api, NSString *messageChannelSuffix) {
  messageChannelSuffix = messageChannelSuffix.length > 0 ? [NSString stringWithFormat: @".%@", messageChannelSuffix] : @"";
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.sunmi_sdk.SunmiSdkApi.initiateRefund", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:GetSunmiSdkCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(initiateRefundDocumentNr:refundAmount:stan:rrn:currencyCode:skipReceiptPrint:skipCustomerReceiptPrint:error:)], @"SunmiSdkApi api (%@) doesn't respond to @selector(initiateRefundDocumentNr:refundAmount:stan:rrn:currencyCode:skipReceiptPrint:skipCustomerReceiptPrint:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray<id> *args = message;
        NSString *arg_documentNr = GetNullableObjectAtIndex(args, 0);
        NSInteger arg_refundAmount = [GetNullableObjectAtIndex(args, 1) integerValue];
        NSString *arg_stan = GetNullableObjectAtIndex(args, 2);
        NSString *arg_rrn = GetNullableObjectAtIndex(args, 3);
        NSString *arg_currencyCode = GetNullableObjectAtIndex(args, 4);
        BOOL arg_skipReceiptPrint = [GetNullableObjectAtIndex(args, 5) boolValue];
        BOOL arg_skipCustomerReceiptPrint = [GetNullableObjectAtIndex(args, 6) boolValue];
        FlutterError *error;
        RefundResponse *output = [api initiateRefundDocumentNr:arg_documentNr refundAmount:arg_refundAmount stan:arg_stan rrn:arg_rrn currencyCode:arg_currencyCode skipReceiptPrint:arg_skipReceiptPrint skipCustomerReceiptPrint:arg_skipCustomerReceiptPrint error:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.sunmi_sdk.SunmiSdkApi.initiateVoid", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:GetSunmiSdkCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(initiateVoidOperationId:partialVoidAmount:skipReceiptPrint:skipCustomerReceiptPrint:error:)], @"SunmiSdkApi api (%@) doesn't respond to @selector(initiateVoidOperationId:partialVoidAmount:skipReceiptPrint:skipCustomerReceiptPrint:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray<id> *args = message;
        NSString *arg_operationId = GetNullableObjectAtIndex(args, 0);
        NSInteger arg_partialVoidAmount = [GetNullableObjectAtIndex(args, 1) integerValue];
        BOOL arg_skipReceiptPrint = [GetNullableObjectAtIndex(args, 2) boolValue];
        BOOL arg_skipCustomerReceiptPrint = [GetNullableObjectAtIndex(args, 3) boolValue];
        FlutterError *error;
        VoidResponse *output = [api initiateVoidOperationId:arg_operationId partialVoidAmount:arg_partialVoidAmount skipReceiptPrint:arg_skipReceiptPrint skipCustomerReceiptPrint:arg_skipCustomerReceiptPrint error:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.sunmi_sdk.SunmiSdkApi.closeDocument", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:GetSunmiSdkCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(closeDocumentDocumentNr:operationIdList:skipReceiptPrint:skipCustomerReceiptPrint:error:)], @"SunmiSdkApi api (%@) doesn't respond to @selector(closeDocumentDocumentNr:operationIdList:skipReceiptPrint:skipCustomerReceiptPrint:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray<id> *args = message;
        NSString *arg_documentNr = GetNullableObjectAtIndex(args, 0);
        NSArray<NSString *> *arg_operationIdList = GetNullableObjectAtIndex(args, 1);
        BOOL arg_skipReceiptPrint = [GetNullableObjectAtIndex(args, 2) boolValue];
        BOOL arg_skipCustomerReceiptPrint = [GetNullableObjectAtIndex(args, 3) boolValue];
        FlutterError *error;
        [api closeDocumentDocumentNr:arg_documentNr operationIdList:arg_operationIdList skipReceiptPrint:arg_skipReceiptPrint skipCustomerReceiptPrint:arg_skipCustomerReceiptPrint error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.sunmi_sdk.SunmiSdkApi.printPlaintext", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:GetSunmiSdkCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(printPlaintextText:error:)], @"SunmiSdkApi api (%@) doesn't respond to @selector(printPlaintextText:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray<id> *args = message;
        NSString *arg_text = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api printPlaintextText:arg_text error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.sunmi_sdk.SunmiSdkApi.setApplicationMode", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:GetSunmiSdkCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setApplicationModeApiKey:mode:error:)], @"SunmiSdkApi api (%@) doesn't respond to @selector(setApplicationModeApiKey:mode:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray<id> *args = message;
        NSString *arg_apiKey = GetNullableObjectAtIndex(args, 0);
        NSString *arg_mode = GetNullableObjectAtIndex(args, 1);
        FlutterError *error;
        [api setApplicationModeApiKey:arg_apiKey mode:arg_mode error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:[NSString stringWithFormat:@"%@%@", @"dev.flutter.pigeon.sunmi_sdk.SunmiSdkApi.startCardPayment", messageChannelSuffix]
        binaryMessenger:binaryMessenger
        codec:GetSunmiSdkCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(startCardPaymentRequest:error:)], @"SunmiSdkApi api (%@) doesn't respond to @selector(startCardPaymentRequest:error:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray<id> *args = message;
        SaleRequest *arg_request = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        SaleResponse *output = [api startCardPaymentRequest:arg_request error:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}