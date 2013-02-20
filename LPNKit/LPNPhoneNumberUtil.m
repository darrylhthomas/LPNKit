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

NSString *const LPNParsingErrorDomain = @"LPNParsingErrorDomain";

NSString *const LPNUnknownRegionCode = @"ZZ";
NSString *const LPNNonGeoEntityRegionCode = @"001";

static LPNPhoneNumberUtil *sharedPhoneNumberUtil = nil;

@interface LPNPhoneNumberUtil ()

- (BOOL)parseString:(NSString *)numberToParse defaultRegion:(NSString *)defaultRegion keeepingRawInput:(BOOL)keepRawInput checkingRegion:(BOOL)checkRegion intoPhoneNumber:(LPNPhoneNumber *)phoneNumber error:(NSError *__autoreleasing*)error;

@end


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

- (void)loadMetadataFromFile:(NSString *)filePath forRegion:(NSString *)regionCode countryCallingCode:(NSUInteger)countryCallingCode
{
    NSURL *url = [NSURL fileURLWithPath:filePath];
    [self loadMetaDataFromURL:url forRegion:regionCode countryCallingCode:countryCallingCode];
}

- (void)loadMetaDataFromURL:(NSURL *)fileURL forRegion:(NSString *)regionCode countryCallingCode:(NSUInteger)countryCallingCode
{
    
}

- (LPNPhoneMetadata *)metadataForRegion:(NSString *)regionCode
{
    return nil;
}

- (LPNPhoneMetadata *)metadataForNonGeographicalRegion:(NSUInteger)countryCallingCode
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

- (LPNPhoneNumber *)examplePhoneNumberForNonGeographicalEntity:(NSUInteger)countryCallingCode
{
    return nil;
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
    return [self parseString:numberToParse defaultRegion:defaultRegion keeepingRawInput:keepRawInput checkingRegion:YES intoPhoneNumber:phoneNumber error:error];
}

- (BOOL)parseString:(NSString *)numberToParse defaultRegion:(NSString *)defaultRegion keeepingRawInput:(BOOL)keepRawInput checkingRegion:(BOOL)checkRegion intoPhoneNumber:(LPNPhoneNumber *)phoneNumber error:(NSError **)error
{
    if (error) {
        *error = [[NSError alloc] initWithDomain:LPNParsingErrorDomain code:LPNInvalidCountryCodeParsingError userInfo:nil];
    }
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

- (NSArray *)regionCodesForCountryCode:(uint32_t)countryCode
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
    return [self isPossiblePhoneNumber:[self phoneNumberByParsingString:phoneNumberString defaultRegion:regionCode keepingRawInput:NO error:NULL]];
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

- (BOOL)maybeStripNationalPrefixAndCarrierCodeFromPhoneNumberString:(NSMutableString *)phoneNumberString withMetadata:(LPNPhoneMetadata *)metadata strippedContents:(NSString *__autoreleasing*)outStrippedContents
{
    return NO;
}

- (LPNCountryCodeSource)maybeStripInternationalPrefixAndNormalizePhoneNumberString:(NSMutableString *)phoneNumberString withPossibleIDDPrefix:(NSString *)possibleIddPrefix
{
    return 0;
}

- (uint32_t)maybeExtractCountryCodeFromPhoneNumberString:(NSString *)phoneNumberString withDefaultRegionMetadata:(LPNPhoneMetadata *)defaultRegionMetadata nationalNumberString:(NSMutableString *)nationalNumberString keepRawInput:(BOOL)keepRawInput phoneNumber:(LPNPhoneNumber *)phoneNumber error:(NSError **)error
{
    return 0;
}

- (LPNMatchType)matchPhoneNumber:(LPNPhoneNumber *)phoneNumber1 againstPhoneNumber:(LPNPhoneNumber *)phoneNumber2
{
    return LPNNoMatchType;
}

- (LPNMatchType)matchPhoneNumber:(LPNPhoneNumber *)phoneNumber1 againstString:(NSString *)phoneNumberString2
{
    NSError *error = nil;
    LPNPhoneNumber *phoneNumber2 = [self phoneNumberByParsingString:phoneNumberString2 defaultRegion:nil keepingRawInput:NO error:&error];
    if (phoneNumber2)
        return [self matchPhoneNumber:phoneNumber1 againstPhoneNumber:phoneNumber2];
    
    if ([error code] == LPNInvalidCountryCodeValidationResult) {
        error = nil;
        
        // The second number has no country calling code. Exact match is no longer possible.
        // We parse it as if the region were the same as that for the first number, and if an exact match is returned, we replace this with an nsn match.
        
        NSString *phoneNumber1Region = [self regionCodeForCountryCode:phoneNumber1.countryCode];
        if (![LPNUnknownRegionCode isEqualToString:phoneNumber1Region]) {
            phoneNumber2 = [self phoneNumberByParsingString:phoneNumberString2 defaultRegion:phoneNumber1Region keepingRawInput:NO error:&error];
            if (phoneNumber2) {
                LPNMatchType result = [self matchPhoneNumber:phoneNumber1 againstPhoneNumber:phoneNumber2];
                if (result == LPNExactMatchType) {
                    
                    return LPNNSNMatchType;
                }
                
                return result;
            }
        } else {
            phoneNumber2 = [[LPNPhoneNumber alloc] init];
            if ([self parseString:phoneNumberString2 defaultRegion:nil keeepingRawInput:NO checkingRegion:NO intoPhoneNumber:phoneNumber2 error:&error]) {
                
                return [self matchPhoneNumber:phoneNumber1 againstPhoneNumber:phoneNumber2];
            }
        }
    }
    
    return LPNNotANumberMatchType;
}

- (LPNMatchType)matchPhoneNumberString:(NSString *)phoneNumberString1 againstString:(NSString *)phoneNumberString2
{
    NSError *error = nil;
    LPNPhoneNumber *phoneNumber1 = [self phoneNumberByParsingString:phoneNumberString1 defaultRegion:LPNUnknownRegionCode keepingRawInput:NO error:&error];
    
    if (phoneNumber1)
        return [self matchPhoneNumber:phoneNumber1 againstString:phoneNumberString2];
    
    if ([error code] == LPNInvalidCountryCodeParsingError) {
        error = nil;
        LPNPhoneNumber *phoneNumber2 = [self phoneNumberByParsingString:phoneNumberString2 defaultRegion:LPNUnknownRegionCode keepingRawInput:NO error:&error];
        
        if (phoneNumberString2)
            return [self matchPhoneNumber:phoneNumber2 againstString:phoneNumberString1];
        
        if ([error code] == LPNInvalidCountryCodeParsingError) {
            phoneNumber1 = [[LPNPhoneNumber alloc] init];
            phoneNumber2 = [[LPNPhoneNumber alloc] init];

            if ([self parseString:phoneNumberString1 defaultRegion:nil keeepingRawInput:NO checkingRegion:NO intoPhoneNumber:phoneNumber1 error:NULL] && [self parseString:phoneNumberString2 defaultRegion:nil keeepingRawInput:NO checkingRegion:NO intoPhoneNumber:phoneNumber2 error:NULL]) {
                
                return [self matchPhoneNumber:phoneNumber1 againstPhoneNumber:phoneNumber2];
            }
        }
    }
    
    return LPNNotANumberMatchType;
}

- (BOOL)phoneNumberCanBeInternationallyDialled:(LPNPhoneNumber *)phoneNumber
{
    return NO;
}

- (BOOL)isAlphaPhoneNumberString:(NSString *)phoneNumberString
{
    return NO;
}

- (BOOL)phoneNumberIsGeographical:(LPNPhoneNumber *)phoneNumber
{
    return NO;
}

@end
