//
//  LPNPhoneNumberUtil.m
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

#import "LPNPhoneNumberUtil.h"

const NSInteger LPNInvalidCountryCodeError = 999;

static LPNPhoneNumberUtil *sharedPhoneNumberUtil = nil;

@implementation LPNPhoneNumberUtil

@synthesize supportedRegions=_supportedRegions;

+ (id)sharedPhoneNumberUtil
{
    if (!sharedPhoneNumberUtil) {
        sharedPhoneNumberUtil = [[LPNPhoneNumberUtil alloc] init];
    }
    
    return sharedPhoneNumberUtil;
}


+ (void)resetSharedPhoneNumberUtil
{
    [sharedPhoneNumberUtil release], sharedPhoneNumberUtil = nil;
}


- (LPNPhoneMetadata *)metadataForRegion:(NSString *)regionCode
{
    return nil;
}


- (BOOL)isLeadingZeroPossibleForCountryCallingCode:(NSUInteger)countryCallingCode
{
    return NO;
}


- (NSUInteger)lengthOfGeographicalAreaCodeForPhoneNumber:(id)phoneNumber
{
    return NSUIntegerMax;
}


- (NSUInteger)lengthOfNationalDestinationCodeForPhoneNumber:(LPNPhoneNumber *)phoneNumber
{
    return NSUIntegerMax;
}


- (NSString *)nationalSignificantNumberForPhoneNumber:(LPNPhoneNumber *)phoneNumber
{
    return nil;
}


- (LPNPhoneNumber *)examplePhoneNumberForRegion:(NSString *)regionCode
{
    return [self examplePhoneNumberOfType:LPNFixedLinePhoneNumberType forRegion:regionCode];
}


- (LPNPhoneNumber *)examplePhoneNumberOfType:(LPNPhoneNumberType)numberType forRegion:(NSString *)regionCode
{
    return nil;
}


- (NSString *)stringByConvertingAlphaCharactersInNumberString:(NSString *)numberString
{
    return nil;
}


- (NSString *)normalizedString:(NSString *)numberString
{
    return nil;
}


- (NSString *)normalizedStringWithDigitsOnly:(NSString *)numberString
{
    return [self normalizedString:numberString keepNonDigits:NO];
}


- (NSString *)normalizedString:(NSString *)numberString keepNonDigits:(BOOL)keepNonDigits
{
    return nil;
}


- (NSString *)stringWithPhoneNumber:(LPNPhoneNumber *)phoneNumber format:(LPNPhoneNumberFormat)format
{
    return nil;
}

- (NSString *)nationalNumberFormatForPhoneNumber:(LPNPhoneNumber *)phoneNumber withCarrierCode:(NSString *)carrierCode
{
    return nil;
}

- (NSString *)nationalNumberFormatForPhoneNumber:(LPNPhoneNumber *)phoneNumber withPreferredCarrierCode:(NSString *)preferredCarrierCode
{
    return nil;
}

- (NSString *)outOfCountryCallingNumberStringWithPhoneNumber:(LPNPhoneNumber *)phoneNumber region:(NSString *)regionCode
{
    return [self outOfCountryCallingNumberStringWithPhoneNumber:phoneNumber region:regionCode keepAlphaCharacters:NO];
}


- (NSString *)outOfCountryCallingNumberStringWithPhoneNumber:(LPNPhoneNumber *)phoneNumber region:(NSString *)regionCode keepAlphaCharacters:(BOOL)keepAlpha
{
    return nil;
}

- (NSString *)stringWithPhoneNumber:(LPNPhoneNumber *)phoneNumber format:(LPNPhoneNumberFormat)format pattern:(LPNNumberFormat *)pattern
{
    return [self stringWithPhoneNumber:phoneNumber format:format patterns:@[pattern]];
}

- (NSString *)mobileDialingNumberFormatForPhoneNumber:(LPNPhoneNumber *)phoneNumber region:(NSString *)regionCode includeFormattingSymbols:(BOOL)includeFormattingSymbols
{
    return nil;
}

- (NSString *)stringWithPhoneNumber:(LPNPhoneNumber *)phoneNumber format:(LPNPhoneNumberFormat)format patterns:(NSArray *)patterns
{
    return nil;
}

- (LPNPhoneNumber *)phoneNumberByParsingString:(NSString *)numberToParse defaultRegion:(NSString *)defaultRegion keepingRawInput:(BOOL)keepRawInput error:(NSError **)error
{
    LPNPhoneNumber *result = [[LPNPhoneNumber alloc] init];
    
    if ([self parseString:numberToParse defaultRegion:defaultRegion keeepingRawInput:keepRawInput intoPhoneNumber:result error:error]) {
        return result;
    }
    
    return nil;
}

- (BOOL)parseString:(NSString *)numberToParse defaultRegion:(NSString *)defaultRegion keeepingRawInput:(BOOL)keepRawInput intoPhoneNumber:(LPNPhoneNumber *)phoneNumber error:(NSError **)error
{
    return NO;
}

- (NSString *)stringInOriginalFormatWithPhoneNumber:(LPNPhoneNumber *)phoneNumber region:(NSString *)region
{
    return nil;
}

- (LPNPhoneNumberType)typeForPhoneNumber:(LPNPhoneNumber *)phoneNumber
{
    return LPNUnknownPhoneNumberType;
}

- (BOOL)isValidNumber:(LPNPhoneNumber *)phoneNumber
{
    return NO;
}

- (BOOL)isValidNumber:(LPNPhoneNumber *)phoneNumber forRegion:(NSString *)regionCode
{
    return NO;
}

- (NSString *)regionCodeForPhoneNumber:(LPNPhoneNumber *)phoneNumber
{
    return nil;
}

- (NSString *)regionCodeForCountryCode:(uint32_t)countryCode
{
    return nil;
}

- (uint32_t)countryCodeForRegion:(NSString *)regionCode
{
    return 0;
}

- (NSString *)nddPrefixForRegion:(NSString *)regionCode stripNonDigits:(BOOL)stripNonDigits
{
    return nil;
}

- (BOOL)isNANPACountry:(NSString *)regionCode
{
    return NO;
}

- (BOOL)isPossiblePhoneNumberString:(NSString *)phoneNumberString dialedFromRegion:(NSString *)regionCode
{
    return [self isPossiblePhoneNumber:[self phoneNumberByParsingString:phoneNumberString defaultRegion:regionCode keepingRawInput:NO error:nil]];
}

- (BOOL)isPossiblePhoneNumber:(LPNPhoneNumber *)phoneNumber
{
    return LPNPhoneNumberIsPossibleValidationResult == [self validatePhoneNumber:phoneNumber];
}

- (LPNPhoneNumberValidationResult)validatePhoneNumber:(LPNPhoneNumber *)phoneNumber
{
    return 0;
}

- (BOOL)truncateTooLongPhoneNumber:(LPNPhoneNumber *)phoneNumber
{
    return NO;
}

- (BOOL)isViablePhoneNumberString:(NSString *)phoneNumberString
{
    return NO;
}

- (NSString *)extractPossiblePhoneNumberString:(NSString *)phoneNumberString
{
    return nil;
}

- (NSString *)maybeStripNationalPrefixAndCarrierCodeFromPhoneNumberString:(NSMutableString *)phoneNumberString withMetadata:(LPNPhoneMetadata *)metadata
{
    return nil;
}

- (LPNCountryCodeSource)maybeStripInternationalPrefixAndNormalizePhoneNumberString:(NSMutableString *)phoneNumberString withPossibleIDDPrefix:(NSString *)possibleIddPrefix
{
    return 0;
}

- (uint32_t)maybeExtractCountryCodeFromPhoneNumberString:(NSString *)phoneNumberString withDefaultRegionMetadata:(LPNPhoneMetadata *)defaultRegionMetadata nationalNumberString:(NSMutableString *)nationalNumberString keepRawInput:(BOOL)keepRawInput phoneNumber:(LPNPhoneNumber *)phoneNumber error:(NSError **)error
{
    return 0;
}

@end
