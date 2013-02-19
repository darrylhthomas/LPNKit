//
//  LPNPhoneNumberUtil.h
//  LPNKit
//
//  Created by Darryl Thomas on 11/9/11.
//  Based on original code and protocol buffer:
//    Copyright (C) 2010-2011 The Libphonenumber Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import <Foundation/Foundation.h>
#import "LPNPhoneNumber.h"

extern NSString *const LPNParsingErrorDomain;

NS_ENUM(NSInteger, LPNParsingError) {
    LPNInvalidCountryCodeParsingError = 5551212,
    LPNNotANumberParsingError,
    LPNTooShortAfterIDDParsingError,
    LPNTooShortNSNParsingError,
    LPNTooLongParsingError,
};

typedef NS_ENUM(NSUInteger, LPNMatchType) {
    LPNNotANumberMatchType,
    LPNNoMatchType,
    LPNShortNSNMatchType,
    LPNNSNMatchType,
    LPNExactMatchType,
};

@class LPNPhoneMetadata;
@class LPNNumberFormat;

@interface LPNPhoneNumberUtil : NSObject

@property (nonatomic, copy, readonly) NSArray *supportedRegions;

+(id)sharedPhoneNumberUtil;
+(void)resetSharedPhoneNumberUtil;

- (LPNPhoneMetadata *)metadataForRegion:(NSString *)regionCode;
- (BOOL)isLeadingZeroPossibleForCountryCallingCode:(NSUInteger)countryCallingCode;
- (NSUInteger)lengthOfGeographicalAreaCodeForPhoneNumber:(LPNPhoneNumber *)phoneNumber;
- (NSUInteger)lengthOfNationalDestinationCodeForPhoneNumber:(LPNPhoneNumber *)phoneNumber;
- (NSString *)nationalSignificantNumberForPhoneNumber:(LPNPhoneNumber *)phoneNumber;

- (LPNPhoneNumber *)examplePhoneNumberForRegion:(NSString *)regionCode;
- (LPNPhoneNumber *)examplePhoneNumberOfType:(LPNPhoneNumberType)numberType forRegion:(NSString *)regionCode;

- (NSString *)stringByConvertingAlphaCharactersInNumberString:(NSString *)numberString;

- (NSString *)normalizedString:(NSString *)numberString;
- (NSString *)normalizedStringWithDigitsOnly:(NSString *)numberString;
- (NSString *)normalizedString:(NSString *)numberString keepNonDigits:(BOOL)keepNonDigits;

- (NSString *)stringWithPhoneNumber:(LPNPhoneNumber *)phoneNumber format:(LPNPhoneNumberFormat)format;

- (NSString *)outOfCountryCallingNumberStringWithPhoneNumber:(LPNPhoneNumber *)phoneNumber region:(NSString *)regionCode;
- (NSString *)outOfCountryCallingNumberStringWithPhoneNumber:(LPNPhoneNumber *)phoneNumber region:(NSString *)regionCode keepAlphaCharacters:(BOOL)keepAlpha;

- (NSString *)nationalNumberFormatForPhoneNumber:(LPNPhoneNumber *)phoneNumber withCarrierCode:(NSString *)carrierCode;
- (NSString *)nationalNumberFormatForPhoneNumber:(LPNPhoneNumber *)phoneNumber withPreferredCarrierCode:(NSString *)preferredCarrierCode;

- (NSString *)mobileDialingNumberFormatForPhoneNumber:(LPNPhoneNumber *)phoneNumber region:(NSString *)regionCode includeFormattingSymbols:(BOOL)includeFormattingSymbols;

- (NSString *)stringWithPhoneNumber:(LPNPhoneNumber *)phoneNumber format:(LPNPhoneNumberFormat)format pattern:(LPNNumberFormat *)pattern;
- (NSString *)stringWithPhoneNumber:(LPNPhoneNumber *)phoneNumber format:(LPNPhoneNumberFormat)format patterns:(NSArray *)patterns;

- (LPNPhoneNumber *)phoneNumberByParsingString:(NSString *)numberToParse defaultRegion:(NSString *)defaultRegion keepingRawInput:(BOOL)keepRawInput error:(NSError *__autoreleasing*)error;
- (BOOL)parseString:(NSString *)numberToParse defaultRegion:(NSString *)defaultRegion keeepingRawInput:(BOOL)keepRawInput intoPhoneNumber:(LPNPhoneNumber *)phoneNumber error:(NSError *__autoreleasing*)error;

- (NSString *)stringInOriginalFormatWithPhoneNumber:(LPNPhoneNumber *)phoneNumber region:(NSString *)region;

- (LPNPhoneNumberType)typeForPhoneNumber:(LPNPhoneNumber *)phoneNumber;

- (BOOL)isValidNumber:(LPNPhoneNumber *)phoneNumber;
- (BOOL)isValidNumber:(LPNPhoneNumber *)phoneNumber forRegion:(NSString *)regionCode;

- (NSString *)regionCodeForPhoneNumber:(LPNPhoneNumber *)phoneNumber;
- (NSString *)regionCodeForCountryCode:(uint32_t)countryCode;
- (uint32_t)countryCodeForRegion:(NSString *)regionCode;

- (NSString *)nddPrefixForRegion:(NSString *)regionCode stripNonDigits:(BOOL)stripNonDigits;

- (BOOL)isNANPACountry:(NSString *)regionCode;

- (BOOL)isPossiblePhoneNumberString:(NSString *)phoneNumberString dialedFromRegion:(NSString *)regionCode;
- (BOOL)isPossiblePhoneNumber:(LPNPhoneNumber *)phoneNumber;
- (LPNPhoneNumberValidationResult)validatePhoneNumber:(LPNPhoneNumber *)phoneNumber;
- (BOOL)isViablePhoneNumberString:(NSString *)phoneNumberString;

- (BOOL)truncateTooLongPhoneNumber:(LPNPhoneNumber *)phoneNumber;

- (NSString *)extractPossiblePhoneNumberString:(NSString *)phoneNumberString;

- (NSString *)maybeStripNationalPrefixAndCarrierCodeFromPhoneNumberString:(NSMutableString *)phoneNumberString withMetadata:(LPNPhoneMetadata *)metadata;
- (LPNCountryCodeSource)maybeStripInternationalPrefixAndNormalizePhoneNumberString:(NSMutableString *)phoneNumberString withPossibleIDDPrefix:(NSString *)possibleIddPrefix;

- (uint32_t)maybeExtractCountryCodeFromPhoneNumberString:(NSString *)phoneNumberString withDefaultRegionMetadata:(LPNPhoneMetadata *)defaultRegionMetadata nationalNumberString:(NSMutableString *)nationalNumberString keepRawInput:(BOOL)keepRawInput phoneNumber:(LPNPhoneNumber *)phoneNumber error:(NSError *__autoreleasing*)error;

- (LPNMatchType)matchPhoneNumber:(LPNPhoneNumber *)phoneNumber1 againstPhoneNumber:(LPNPhoneNumber *)phoneNumber2;
- (LPNMatchType)matchPhoneNumber:(LPNPhoneNumber *)phoneNumber againstString:(NSString *)phoneNumberString;
- (LPNMatchType)matchPhoneNumberString:(NSString *)phoneNumberString1 againstString:(NSString *)phoneNumberString2;

- (BOOL)phoneNumberCanBeInternationallyDialled:(LPNPhoneNumber *)phoneNumber;

- (BOOL)isAlphaPhoneNumberString:(NSString *)phoneNumberString;

@end
