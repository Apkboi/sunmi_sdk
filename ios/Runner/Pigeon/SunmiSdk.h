// Autogenerated from Pigeon (v22.5.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import <Foundation/Foundation.h>

@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class SaleRequest;
@class SaleResponse;
@class RefundRequest;
@class VoidRequest;
@class CloseDocumentRequest;
@class RefundResponse;
@class VoidResponse;

@interface SaleRequest : NSObject
+ (instancetype)makeWithAmount:(nullable NSNumber *)amount
    currencyCode:(nullable NSString *)currencyCode
    documentNr:(nullable NSString *)documentNr;
@property(nonatomic, strong, nullable) NSNumber * amount;
@property(nonatomic, copy, nullable) NSString * currencyCode;
@property(nonatomic, copy, nullable) NSString * documentNr;
@end

@interface SaleResponse : NSObject
+ (instancetype)makeWithStatus:(nullable NSString *)status
    message:(nullable NSString *)message;
@property(nonatomic, copy, nullable) NSString * status;
@property(nonatomic, copy, nullable) NSString * message;
@end

@interface RefundRequest : NSObject
+ (instancetype)makeWithRefundAmount:(nullable NSNumber *)refundAmount
    currencyCode:(nullable NSString *)currencyCode
    documentNr:(nullable NSString *)documentNr
    stan:(nullable NSString *)stan
    transactionDate:(nullable NSString *)transactionDate
    rrn:(nullable NSString *)rrn
    skipReceiptPrint:(nullable NSNumber *)skipReceiptPrint
    skipCustomerReceiptPrint:(nullable NSNumber *)skipCustomerReceiptPrint;
@property(nonatomic, strong, nullable) NSNumber * refundAmount;
@property(nonatomic, copy, nullable) NSString * currencyCode;
@property(nonatomic, copy, nullable) NSString * documentNr;
@property(nonatomic, copy, nullable) NSString * stan;
@property(nonatomic, copy, nullable) NSString * transactionDate;
@property(nonatomic, copy, nullable) NSString * rrn;
@property(nonatomic, strong, nullable) NSNumber * skipReceiptPrint;
@property(nonatomic, strong, nullable) NSNumber * skipCustomerReceiptPrint;
@end

@interface VoidRequest : NSObject
+ (instancetype)makeWithOperationId:(nullable NSString *)operationId
    partialVoidAmount:(nullable NSNumber *)partialVoidAmount
    skipReceiptPrint:(nullable NSNumber *)skipReceiptPrint
    skipCustomerReceiptPrint:(nullable NSNumber *)skipCustomerReceiptPrint;
@property(nonatomic, copy, nullable) NSString * operationId;
@property(nonatomic, strong, nullable) NSNumber * partialVoidAmount;
@property(nonatomic, strong, nullable) NSNumber * skipReceiptPrint;
@property(nonatomic, strong, nullable) NSNumber * skipCustomerReceiptPrint;
@end

@interface CloseDocumentRequest : NSObject
+ (instancetype)makeWithDocumentNr:(nullable NSString *)documentNr
    operationIdList:(nullable NSArray<NSString *> *)operationIdList
    skipReceiptPrint:(nullable NSNumber *)skipReceiptPrint
    skipCustomerReceiptPrint:(nullable NSNumber *)skipCustomerReceiptPrint;
@property(nonatomic, copy, nullable) NSString * documentNr;
@property(nonatomic, copy, nullable) NSArray<NSString *> * operationIdList;
@property(nonatomic, strong, nullable) NSNumber * skipReceiptPrint;
@property(nonatomic, strong, nullable) NSNumber * skipCustomerReceiptPrint;
@end

@interface RefundResponse : NSObject
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
    actionCode:(nullable NSString *)actionCode;
@property(nonatomic, copy, nullable) NSString * operationId;
@property(nonatomic, copy, nullable) NSString * cryptogram;
@property(nonatomic, copy, nullable) NSString * documentNr;
@property(nonatomic, strong, nullable) NSNumber * amountAuthorized;
@property(nonatomic, strong, nullable) NSNumber * amountAdditional;
@property(nonatomic, copy, nullable) NSString * authCode;
@property(nonatomic, copy, nullable) NSString * rrn;
@property(nonatomic, copy, nullable) NSString * stan;
@property(nonatomic, copy, nullable) NSString * cardType;
@property(nonatomic, copy, nullable) NSString * state;
@property(nonatomic, copy, nullable) NSString * receiptText;
@property(nonatomic, copy, nullable) NSString * actionCode;
@end

@interface VoidResponse : NSObject
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
    receiptText:(nullable NSString *)receiptText;
@property(nonatomic, copy, nullable) NSString * operationId;
@property(nonatomic, copy, nullable) NSString * cryptogram;
@property(nonatomic, copy, nullable) NSString * documentNr;
@property(nonatomic, strong, nullable) NSNumber * amountAuthorized;
@property(nonatomic, strong, nullable) NSNumber * amountAdditional;
@property(nonatomic, copy, nullable) NSString * authCode;
@property(nonatomic, copy, nullable) NSString * rrn;
@property(nonatomic, copy, nullable) NSString * stan;
@property(nonatomic, copy, nullable) NSString * cardType;
@property(nonatomic, copy, nullable) NSString * state;
@property(nonatomic, copy, nullable) NSString * receiptText;
@end

/// The codec used by all APIs.
NSObject<FlutterMessageCodec> *GetSunmiSdkCodec(void);

@protocol SunmiSdkApi
/// @return `nil` only when `error != nil`.
- (nullable RefundResponse *)initiateRefundDocumentNr:(NSString *)documentNr refundAmount:(NSInteger)refundAmount stan:(NSString *)stan rrn:(NSString *)rrn currencyCode:(NSString *)currencyCode skipReceiptPrint:(BOOL)skipReceiptPrint skipCustomerReceiptPrint:(BOOL)skipCustomerReceiptPrint error:(FlutterError *_Nullable *_Nonnull)error;
/// @return `nil` only when `error != nil`.
- (nullable VoidResponse *)initiateVoidOperationId:(NSString *)operationId partialVoidAmount:(NSInteger)partialVoidAmount skipReceiptPrint:(BOOL)skipReceiptPrint skipCustomerReceiptPrint:(BOOL)skipCustomerReceiptPrint error:(FlutterError *_Nullable *_Nonnull)error;
- (void)closeDocumentDocumentNr:(NSString *)documentNr operationIdList:(NSArray<NSString *> *)operationIdList skipReceiptPrint:(BOOL)skipReceiptPrint skipCustomerReceiptPrint:(BOOL)skipCustomerReceiptPrint error:(FlutterError *_Nullable *_Nonnull)error;
- (void)printPlaintextText:(NSString *)text error:(FlutterError *_Nullable *_Nonnull)error;
- (void)setApplicationModeApiKey:(NSString *)apiKey mode:(NSString *)mode error:(FlutterError *_Nullable *_Nonnull)error;
/// @return `nil` only when `error != nil`.
- (nullable SaleResponse *)startCardPaymentRequest:(SaleRequest *)request error:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void SetUpSunmiSdkApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<SunmiSdkApi> *_Nullable api);

extern void SetUpSunmiSdkApiWithSuffix(id<FlutterBinaryMessenger> binaryMessenger, NSObject<SunmiSdkApi> *_Nullable api, NSString *messageChannelSuffix);

NS_ASSUME_NONNULL_END
