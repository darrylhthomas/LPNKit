//
//  LPNPhoneNumberUtilTests.m
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

#import "LPNPhoneNumberUtilTests.h"
#import "LPNPhoneNumber.h"
#import "LPNPhoneNumberUtil.h"
#import "LPNPhoneMetadata.h"
#import "LPNNumberFormat.h"
#import "LPNPhoneNumberDescription.h"

static LPNPhoneNumber *alphanumericNumber = nil;
static LPNPhoneNumber *arMobile = nil;
static LPNPhoneNumber *arNumber = nil;
static LPNPhoneNumber *auNumber = nil;
static LPNPhoneNumber *bsMobile = nil;
static LPNPhoneNumber *bsNumber = nil;
static LPNPhoneNumber *deNumber = nil;
static LPNPhoneNumber *deShortNumber = nil;
static LPNPhoneNumber *gbMobile = nil;
static LPNPhoneNumber *gbNumber = nil;
static LPNPhoneNumber *itMobile = nil;
static LPNPhoneNumber *itNumber = nil;

static LPNPhoneNumber *mxMobile1 = nil;
static LPNPhoneNumber *mxMobile2 = nil;
static LPNPhoneNumber *mxNumber1 = nil;
static LPNPhoneNumber *mxNumber2 = nil;
static LPNPhoneNumber *nzNumber = nil;
static LPNPhoneNumber *sgNumber = nil;

static LPNPhoneNumber *usLongNumber = nil;
static LPNPhoneNumber *usNumber = nil;
static LPNPhoneNumber *usPremium = nil;
static LPNPhoneNumber *usLocalNumber = nil;
static LPNPhoneNumber *usShortByOneNumber = nil;
static LPNPhoneNumber *usTollfree = nil;
static LPNPhoneNumber *usSpoof = nil;
static LPNPhoneNumber *usSpoofWithRawInput = nil;

@implementation LPNPhoneNumberUtilTests
{
    LPNPhoneNumberUtil *phoneUtil;
}


+(void)setUp
{
    [super setUp];
    
    alphanumericNumber = [[LPNPhoneNumber alloc] init];
    alphanumericNumber.countryCode = 1;
    alphanumericNumber.nationalNumber = 80074935247;
    
    arMobile = [[LPNPhoneNumber alloc] init];
    arMobile.countryCode = 54;
    arMobile.nationalNumber = 91187654321;
    
    arNumber = [[LPNPhoneNumber alloc] init];
    arNumber.countryCode = 54;
    arNumber.nationalNumber = 1187654321;
    
    auNumber = [[LPNPhoneNumber alloc] init];
    auNumber.countryCode = 61;
    auNumber.nationalNumber = 236618300;
    
    bsMobile = [[LPNPhoneNumber alloc] init];
    bsMobile.countryCode = 1;
    bsMobile.nationalNumber = 2423570000;
    
    bsNumber = [[LPNPhoneNumber alloc] init];
    bsNumber.countryCode = 1;
    bsNumber.nationalNumber = 2423651234;
    
    deNumber = [[LPNPhoneNumber alloc] init];
    deNumber.countryCode = 49;
    deNumber.nationalNumber = 30123456;
    
    deShortNumber = [[LPNPhoneNumber alloc] init];
    deShortNumber.countryCode = 49;
    deShortNumber.nationalNumber = 1234;
    
    gbMobile = [[LPNPhoneNumber alloc] init];
    gbMobile.countryCode = 44;
    gbMobile.nationalNumber = 7912345678;

    gbNumber = [[LPNPhoneNumber alloc] init];
    gbNumber.countryCode = 44;
    gbNumber.nationalNumber = 2070313000;
    
    itMobile = [[LPNPhoneNumber alloc] init];
    itMobile.countryCode = 39;
    itMobile.nationalNumber = 345678901;
    
    itNumber = [[LPNPhoneNumber alloc] init];
    itNumber.countryCode = 39;
    itNumber.nationalNumber = 236618300;
    itNumber.italianLeadingZero = YES;
    
    mxMobile1 = [[LPNPhoneNumber alloc] init];
    mxMobile1.countryCode = 52;
    mxMobile1.nationalNumber = 12345678900;
    
    mxMobile2 = [[LPNPhoneNumber alloc] init];
    mxMobile2.countryCode = 52;
    mxMobile2.nationalNumber = 15512345678;
    
    mxNumber1 = [[LPNPhoneNumber alloc] init];
    mxNumber1.countryCode = 52;
    mxNumber1.nationalNumber = 3312345678;
    
    mxNumber2 = [[LPNPhoneNumber alloc] init];
    mxNumber2.countryCode = 52;
    mxNumber2.nationalNumber = 8211234567;
    
    nzNumber = [[LPNPhoneNumber alloc] init];
    nzNumber.countryCode = 64;
    nzNumber.nationalNumber = 33316005;
    
    sgNumber = [[LPNPhoneNumber alloc] init];
    sgNumber.countryCode = 65;
    sgNumber.nationalNumber = 65218000;
    
    usLongNumber = [[LPNPhoneNumber alloc] init];
    usLongNumber.countryCode = 1;
    usLongNumber.nationalNumber = 65025300001;

    usNumber = [[LPNPhoneNumber alloc] init];
    usNumber.countryCode = 1;
    usNumber.nationalNumber = 6502530000;
    
    usPremium = [[LPNPhoneNumber alloc] init];
    usNumber.countryCode = 1;
    usNumber.nationalNumber = 9002530000;
    
    usLocalNumber = [[LPNPhoneNumber alloc] init];
    usLocalNumber.countryCode = 1;
    usLocalNumber.nationalNumber = 2530000;
    
    usShortByOneNumber = [[LPNPhoneNumber alloc] init];
    usShortByOneNumber.countryCode = 1;
    usShortByOneNumber.nationalNumber = 650253000;
    
    usTollfree = [[LPNPhoneNumber alloc] init];
    usTollfree.countryCode = 1;
    usTollfree.nationalNumber = 8002530000;
    
    usSpoof = [[LPNPhoneNumber alloc] init];
    usSpoof.countryCode = 1;
    usSpoof.nationalNumber = 0;

    usSpoofWithRawInput = [[LPNPhoneNumber alloc] init];
    usSpoofWithRawInput.countryCode = 1;
    usSpoofWithRawInput.nationalNumber = 0;
    usSpoofWithRawInput.rawInput = @"000-000-0000";
    
}

- (void)setUp
{
    [super setUp];
    
    [LPNPhoneNumberUtil resetSharedPhoneNumberUtil]; 
    phoneUtil = [LPNPhoneNumberUtil sharedPhoneNumberUtil];
}

+(void)tearDown
{
    [super tearDown];
}


-(void)testSupportedRegions
{
    STAssertTrue([phoneUtil.supportedRegions count] > 0, @"The number of supported regions should be greater than 0.");
}


-(void)testUSMetadata
{
    LPNPhoneMetadata *metadata = [phoneUtil metadataForRegion:@"US"];
    
    STAssertEqualObjects(@"US", metadata.identifier, @"Must have the correct identifier.");
    
    STAssertEquals(1, metadata.countryCode, @"Must have the correct country code.");
    
    STAssertEqualObjects(@"011", metadata.internationalDialingPrefix, @"Must have the correct international dialing prefix.");
    
    STAssertNotNil(metadata.nationalPrefix, @"Must have national prefix.");
    
    STAssertEquals(2, [metadata.numberFormats count], @"Must have the correct number of number formats.");
    
    
    LPNNumberFormat *testNumberFormat = [metadata.numberFormats objectAtIndex:1];
    
    STAssertEqualObjects(@"(\\d{3})(\\d{3})(\\d{4})", testNumberFormat.pattern, @"Must have the correct number format pattern.");
    
    STAssertEqualObjects(@"$1 $2 $3", testNumberFormat.format, @"Must have the correct number format…erm…format.");
    
    STAssertEqualObjects(@"[12-689]\\d{9}|2[0-35-9]\\d{8}", metadata.generalDescription.nationalNumberPattern, @"General description must have the correct national number pattern.");
    
    STAssertEqualObjects(@"\\d{7}(?:\\d{3})?", metadata.generalDescription.possibleNumberPattern, @"General description must have the correct possible number pattern.");
    
    STAssertEquals(metadata.generalDescription, metadata.fixedLineDescription, @"General description must be exactly the same as the fixed line description.");
    
    STAssertEqualObjects(@"\\d{10}", metadata.tollFreeDescription.possibleNumberPattern, @"Tollfree description must have the correct possible number pattern.");
    
    STAssertEqualObjects(@"900\\d{7}", metadata.premiumRateDescription.possibleNumberPattern, @"Premium rate description must have the correct possible number pattern.");
    
    STAssertNil(metadata.sharedCostDescription, @"Should not have a shared cost description.");
}


- (void)testDEMetadata
{
    LPNPhoneMetadata *metadata = [phoneUtil metadataForRegion:@"DE"];
    
    STAssertEqualObjects(@"DE", metadata.identifier, @"Must have the correct identifier.");
    
    STAssertEquals(49, metadata.countryCode, @"Must have the correct country code.");
    
    STAssertEqualObjects(@"00", metadata.internationalDialingPrefix, @"Must have the correct international dialing prefix.");
    
    STAssertEqualObjects(@"0", metadata.nationalPrefix, @"Must have the correct national prefix.");
    
    STAssertEquals(6, [metadata.numberFormats count], @"Must have the correct number of number formats.");
    
    
    LPNNumberFormat *testNumberFormat = [metadata.numberFormats objectAtIndex:5];
    
    STAssertEquals(1, [testNumberFormat.leadingDigitsPatterns count], @"Must have the correct number of leading digits patterns.");
    
    STAssertEqualObjects(@"900", [testNumberFormat.leadingDigitsPatterns objectAtIndex:0], @"Must have the correct leading digits pattern.");
    
    STAssertEqualObjects(@"(\\d{3})(\\d{3,4})(\\d{4})", testNumberFormat.pattern, @"Must have the correct number format pattern.");
    
    STAssertEqualObjects(@"$1 $2 $3", testNumberFormat.format, @"Must have the correct number format…erm…format.");
    
    STAssertEqualObjects(@"(?:[24-6]\\d{2}|3[03-9]\\d|[789](?:[1-9]\\d|0[2-9]))\\d{1,8}", metadata.fixedLineDescription.nationalNumberPattern, @"Fixed line description must have the correct national number pattern.");
    
    STAssertEqualObjects(@"\\d{2,14}", metadata.fixedLineDescription.possibleNumberPattern, @"Fixed line description must have the correct possible number pattern.");

    STAssertEqualObjects(@"30123456", metadata.fixedLineDescription.exampleNumber, @"Fixed line description must have the correct example number.");
    
    STAssertEqualObjects(@"\\d{10}", metadata.tollFreeDescription.possibleNumberPattern, @"Tollfree description must have the correct possible number pattern.");
    
    STAssertEqualObjects(@"900([135]\\d{6}|9\\d{7})", metadata.premiumRateDescription.nationalNumberPattern, @"Premium rate description must have the correct national number pattern.");
    
}



- (void)testARMetadata
{
    LPNPhoneMetadata *metadata = [phoneUtil metadataForRegion:@"AR"];
    
    STAssertEqualObjects(@"AR", metadata.identifier, @"Must have the correct identifier.");
    
    STAssertEquals(54, metadata.countryCode, @"Must have the correct country code.");
    
    STAssertEqualObjects(@"00", metadata.internationalDialingPrefix, @"Must have the correct international dialing prefix.");
    
    STAssertEqualObjects(@"0", metadata.nationalPrefix, @"Must have the correct national prefix.");
    
    STAssertEqualObjects(@"0(?:(11|343|3715)15)?", metadata.nationalPrefixForParsing, @"Must have the correct national prefix for parsing.");
    
    STAssertEqualObjects(@"9$1", metadata.nationalPrefixTransformRule, @"Must have the correct national prefix transform rule.");
    
    
    LPNNumberFormat *testNumberFormat = [metadata.numberFormats objectAtIndex:2];
    
    STAssertEqualObjects(@"$2 15 $3-$4", testNumberFormat.format, @"Must have the correct number format…erm…format.");
    
    testNumberFormat = [metadata.numberFormats objectAtIndex:3];
    
    STAssertEqualObjects(@"(9)(\\d{4})(\\d{2})(\\d{4})", testNumberFormat.pattern, @"Must have the correct number format pattern.");
    
    testNumberFormat = [metadata.internationalNumberFormats objectAtIndex:3];
    
    STAssertEqualObjects(@"(9)(\\d{4})(\\d{2})(\\d{4})", testNumberFormat.pattern, @"Must have the correct number format pattern.");
    
    STAssertEqualObjects(@"$1 $2 $3 $4", testNumberFormat.format, @"Must have the correct number format…erm…format.");
}


- (void)testIsLeadingZeroPossibleForCountryCallingCode
{
    STAssertTrue([phoneUtil isLeadingZeroPossibleForCountryCallingCode:39], @"Leading zero should be possible for Italy.");
    STAssertFalse([phoneUtil isLeadingZeroPossibleForCountryCallingCode:1], @"Leading zero should not be possible for USA.");
    STAssertFalse([phoneUtil isLeadingZeroPossibleForCountryCallingCode:800], @"Leading zero should not be possible for calling codes not in metadata.");
}


- (void)testLengthOfGeographicalAreaCodeForPhoneNumber
{
    STAssertEquals(3, [phoneUtil lengthOfGeographicalAreaCodeForPhoneNumber:usNumber], @"Length of US number area code (650) should be correct.");
    
    STAssertEquals(0, [phoneUtil lengthOfGeographicalAreaCodeForPhoneNumber:usTollfree], @"Length of US tollfree area code should be 0.");
    
    STAssertEquals(2, [phoneUtil lengthOfGeographicalAreaCodeForPhoneNumber:gbNumber], @"Length of GB number area code (20) should be correct.");
    
    STAssertEquals(0, [phoneUtil lengthOfGeographicalAreaCodeForPhoneNumber:gbMobile], @"Length of GB mobile area code (none) should be correct.");
    
    STAssertEquals(2, [phoneUtil lengthOfGeographicalAreaCodeForPhoneNumber:arMobile], @"Length of AR number area code (11) should be correct.");
    
    STAssertEquals(1, [phoneUtil lengthOfGeographicalAreaCodeForPhoneNumber:auNumber], @"Length of AU number area code (2) should be correct.");
    
    STAssertEquals(0, [phoneUtil lengthOfGeographicalAreaCodeForPhoneNumber:sgNumber], @"Length of SG number area code (none) should be correct.");
    
    STAssertEquals(0, [phoneUtil lengthOfGeographicalAreaCodeForPhoneNumber:usShortByOneNumber], @"Length of invalid US number (short by 1 digit, no area code) should be correct.");
    
}


- (void)testLengthOfNationalDestinationCodeForPhoneNumber
{
    STAssertEquals(3, [phoneUtil lengthOfNationalDestinationCodeForPhoneNumber:usNumber], @"Length of national destination code for us number (650) should be correct.");
    
    STAssertEquals(3, [phoneUtil lengthOfNationalDestinationCodeForPhoneNumber:usTollfree], @"Length of national destination code for NA tollfree (800) should be correct.");
    
    STAssertEquals(2, [phoneUtil lengthOfNationalDestinationCodeForPhoneNumber:gbNumber], @"Length of national destination code for gb number (20) should be correct.");
    
    STAssertEquals(4, [phoneUtil lengthOfNationalDestinationCodeForPhoneNumber:gbMobile], @"Length of national destination code for gb mobile (7912) should be correct.");
    
    STAssertEquals(2, [phoneUtil lengthOfNationalDestinationCodeForPhoneNumber:arNumber], @"Length of national destination code for ar number (11) should be correct.");
    
    STAssertEquals(3, [phoneUtil lengthOfNationalDestinationCodeForPhoneNumber:arMobile], @"Length of national destination code for ar mobile (911) should be correct.");
    
    STAssertEquals(1, [phoneUtil lengthOfNationalDestinationCodeForPhoneNumber:auNumber], @"Length of national destination code for au number (2) should be correct.");
    
    STAssertEquals(4, [phoneUtil lengthOfNationalDestinationCodeForPhoneNumber:sgNumber], @"Length of national destination code for sg number (6521) should be correct.");
    
    STAssertEquals(0, [phoneUtil lengthOfNationalDestinationCodeForPhoneNumber:usShortByOneNumber], @"Length of national destination code for invalid us number (short by 1 digit, no NDC) should be correct.");
    
    LPNPhoneNumber * invalidCountryPhoneNumber = [[LPNPhoneNumber alloc] init];
    invalidCountryPhoneNumber.countryCode = 123;
    invalidCountryPhoneNumber.nationalNumber = 6502530000;
    STAssertEquals(0, [phoneUtil lengthOfNationalDestinationCodeForPhoneNumber:invalidCountryPhoneNumber], @"Number with invalid country code should not have an NDC.");
}


- (void)testNationalSignificantNumberForPhoneNumber
{
    STAssertEqualObjects(@"6502530000", [phoneUtil nationalSignificantNumberForPhoneNumber:usNumber], @"Should return the correct NSN for a US number.");
    
    STAssertEqualObjects(@"345678901", [phoneUtil nationalSignificantNumberForPhoneNumber:itMobile], @"Should return the correct NSN for an IT mobile.");
    
    STAssertEqualObjects(@"0236618300", [phoneUtil nationalSignificantNumberForPhoneNumber:itNumber], @"Should return the correct NSN for an IT fixed line number.");
}


- (void)testExampleNumbers
{
    STAssertEqualObjects(deNumber, [phoneUtil examplePhoneNumberForRegion:@"DE"], @"Should return the correct phone number for the region.");
    
    STAssertEqualObjects(deNumber, [phoneUtil examplePhoneNumberOfType:LPNFixedLinePhoneNumberType forRegion:@"DE"], @"Should return the correct phone number for the region and type.");
    
    STAssertNil([phoneUtil examplePhoneNumberOfType:LPNMobilePhoneNumberType forRegion:@"DE"], @"Should not return a phone number when no example for the phone number and type is available.");
    
    STAssertNotNil([phoneUtil examplePhoneNumberOfType:LPNFixedLinePhoneNumberType forRegion:@"US"], @"Should return an example number when placed under general description when request type is fixed line.");

    STAssertNotNil([phoneUtil examplePhoneNumberOfType:LPNMobilePhoneNumberType forRegion:@"US"], @"Should return an example number when placed under general description when request type is mobile.");
    
    STAssertNil([phoneUtil examplePhoneNumberOfType:LPNMobilePhoneNumberType forRegion:@"CS"], @"Should not return an example number when the region code is invalid.");
}


- (void)testStringByCovertingAlphaCharactersInNumberString
{
    NSString *input = @"1800-ABC-DEF";
    NSString *expectedOutput = @"1800-222-333";
    
    STAssertEqualObjects(expectedOutput, [phoneUtil stringByConvertingAlphaCharactersInNumberString:input], @"Should convert alpha characters correctly.");
}


- (void)testNormalizedStringRemovesPunctuation
{
    NSString *input = @"034-56&+#234";
    NSString *expectedOutput = @"03456234";
    
    STAssertEqualObjects(expectedOutput, [phoneUtil normalizedString:input], @"Should remove punctuation correctly.");
}


- (void)testNormalizedStringReplacesAlphaCharacters
{
    NSString *input = @"034-I-am-HUNGRY";
    NSString *expectedOutput = @"034426486479";
    
    STAssertEqualObjects(expectedOutput, [phoneUtil normalizedString:input], @"Should replace alpha characters correctly.");
}


- (void)testNormalizedStringReplacesOtherDigits
{
    NSString *input = @"\uFF125\u0665";
    NSString *expectedOutput = @"255";
    
    STAssertEqualObjects(expectedOutput, [phoneUtil normalizedString:input], @"Should replace non-latin digits correctly.");
    
    
    input = @"\u06F52\u06F0";
    expectedOutput = @"520";
    
    STAssertEqualObjects(expectedOutput, [phoneUtil normalizedString:input], @"Should replace Eastern-Arabic digits correctly.");
}


- (void)testNormalizedStringWithDigitsOnlyStripsAlphaCharacters
{
    NSString *input = @"034-56&+a#234";
    NSString *expectedOutput = @"03456234";
    
    STAssertEqualObjects(expectedOutput, [phoneUtil normalizedStringWithDigitsOnly:input], @"Should remove alpha characters correctly.");
}


- (void)testFormatUSNumber
{
    STAssertEqualObjects(@"650 253 0000", [phoneUtil stringWithPhoneNumber:usNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    
    STAssertEqualObjects(@"+1 650 253 0000", [phoneUtil stringWithPhoneNumber:usNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    
    STAssertEqualObjects(@"800 253 0000", [phoneUtil stringWithPhoneNumber:usTollfree format:LPNNationalPhoneNumberFormat], @"Should correctly national format tollfree phone numbers.");
    
    STAssertEqualObjects(@"+1 800 253 0000", [phoneUtil stringWithPhoneNumber:usTollfree format:LPNInternationalPhoneNumberFormat], @"Should correctly international format tollfree phone numbers.");
    
    STAssertEqualObjects(@"900 253 0000", [phoneUtil stringWithPhoneNumber:usPremium format:LPNNationalPhoneNumberFormat], @"Should correctly national format premium phone numbers.");
    
    STAssertEqualObjects(@"+1 900 253 0000", [phoneUtil stringWithPhoneNumber:usPremium format:LPNInternationalPhoneNumberFormat], @"Should correctly international format premium phone numbers.");
    
    STAssertEqualObjects(@"+1-900-253-0000", [phoneUtil stringWithPhoneNumber:usPremium format:LPNRFC3966PhoneNumberFormat], @"Should correctly RFC3966 format premium phone numbers.");
    
    STAssertEqualObjects(@"000-000-0000", [phoneUtil stringWithPhoneNumber:usSpoofWithRawInput format:LPNNationalPhoneNumberFormat], @"Numbers with all zeros should format using raw input no matter which format is specified.");
    
    STAssertEqualObjects(@"0", [phoneUtil stringWithPhoneNumber:usSpoof format:LPNNationalPhoneNumberFormat], @"Numbers with all zeros should format using raw input no matter which format is specified.");
}


- (void)testFormatBSNumber
{
    STAssertEqualObjects(@"242 365 1234", [phoneUtil stringWithPhoneNumber:bsNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+1 242 365 1234", [phoneUtil stringWithPhoneNumber:bsNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
}


- (void)testFormatGBNumber
{
    STAssertEqualObjects(@"(020) 7031 3000", [phoneUtil stringWithPhoneNumber:gbNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+44 20 7031 3000", [phoneUtil stringWithPhoneNumber:gbNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");

    STAssertEqualObjects(@"(07912) 345 678", [phoneUtil stringWithPhoneNumber:gbMobile format:LPNNationalPhoneNumberFormat], @"Should correctly national format mobile numbers.");
    STAssertEqualObjects(@"+44 7912 345 678", [phoneUtil stringWithPhoneNumber:gbMobile format:LPNInternationalPhoneNumberFormat], @"Should correctly international format mobile numbers.");
}


- (void)testFormatDENumber
{
    LPNPhoneNumber *deNumber = [[LPNPhoneNumber alloc] init];
    
    deNumber.countryCode = 49;
    deNumber.nationalNumber = 301234;
    STAssertEqualObjects(@"030/1234", [phoneUtil stringWithPhoneNumber:deNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    
    STAssertEqualObjects(@"+49 30/1234", [phoneUtil stringWithPhoneNumber:deNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    
    STAssertEqualObjects(@"+49-30-1234", [phoneUtil stringWithPhoneNumber:deNumber format:LPNRFC3966PhoneNumberFormat], @"Should correctly RFC3966 format phone numbers.");
    
    
    [deNumber clear];
    deNumber.countryCode = 49;
    deNumber.nationalNumber = 291123;
    STAssertEqualObjects(@"0291 123", [phoneUtil stringWithPhoneNumber:deNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    
    STAssertEqualObjects(@"+49 291 123", [phoneUtil stringWithPhoneNumber:deNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    
    
    [deNumber clear];
    deNumber.countryCode = 49;
    deNumber.nationalNumber = 29112345678;
    STAssertEqualObjects(@"0291 12345678", [phoneUtil stringWithPhoneNumber:deNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    
    STAssertEqualObjects(@"+49 291 12345678", [phoneUtil stringWithPhoneNumber:deNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    
    
    [deNumber clear];
    deNumber.countryCode = 49;
    deNumber.nationalNumber = 912312345;
    STAssertEqualObjects(@"09123 12345", [phoneUtil stringWithPhoneNumber:deNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    
    STAssertEqualObjects(@"+49 9123 12345", [phoneUtil stringWithPhoneNumber:deNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
        
    
    [deNumber clear];
    deNumber.countryCode = 49;
    deNumber.nationalNumber = 80212345;
    STAssertEqualObjects(@"08021 2345", [phoneUtil stringWithPhoneNumber:deNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    
    STAssertEqualObjects(@"+49 8021 2345", [phoneUtil stringWithPhoneNumber:deNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    
    
    STAssertEqualObjects(@"1234", [phoneUtil stringWithPhoneNumber:deShortNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format short phone numbers.");
    
    STAssertEqualObjects(@"+49 1234", [phoneUtil stringWithPhoneNumber:deNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format short phone numbers.");
    
    
    [deNumber clear];
    deNumber.countryCode = 49;
    deNumber.nationalNumber = 41341234;
    STAssertEqualObjects(@"04134 1234", [phoneUtil stringWithPhoneNumber:deNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
}


- (void)testFormatITNumber
{
    STAssertEqualObjects(@"02 3661 8300", [phoneUtil stringWithPhoneNumber:itNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+39 02 3661 8300", [phoneUtil stringWithPhoneNumber:itNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    STAssertEqualObjects(@"+390236618300", [phoneUtil stringWithPhoneNumber:itNumber format:LPNE164PhoneNumberFormat], @"Should correctly E164 format phone numbers.");


    STAssertEqualObjects(@"345 678 901", [phoneUtil stringWithPhoneNumber:itMobile format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+39 345 678 901", [phoneUtil stringWithPhoneNumber:itMobile format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    STAssertEqualObjects(@"+39345678901", [phoneUtil stringWithPhoneNumber:itMobile format:LPNE164PhoneNumberFormat], @"Should correctly E164 format phone numbers.");
}


- (void)testFormatAUNumber
{
    STAssertEqualObjects(@"02 3661 8300", [phoneUtil stringWithPhoneNumber:auNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+61 2 3661 8300", [phoneUtil stringWithPhoneNumber:auNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    STAssertEqualObjects(@"+61236618300", [phoneUtil stringWithPhoneNumber:auNumber format:LPNE164PhoneNumberFormat], @"Should correctly E164 format phone numbers.");
    
    LPNPhoneNumber *au800Number = [[LPNPhoneNumber alloc] init];
    au800Number.countryCode = 61;
    au800Number.nationalNumber = 1800123456;
    STAssertEqualObjects(@"1800 123 456", [phoneUtil stringWithPhoneNumber:au800Number format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+61 1800 123 456", [phoneUtil stringWithPhoneNumber:au800Number format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    STAssertEqualObjects(@"+611800123456", [phoneUtil stringWithPhoneNumber:au800Number format:LPNE164PhoneNumberFormat], @"Should correctly E164 format phone numbers.");
}


- (void)testFormatARNumber
{
    STAssertEqualObjects(@"011 8765-4321", [phoneUtil stringWithPhoneNumber:arNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+54 11 8765-4321", [phoneUtil stringWithPhoneNumber:arNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    STAssertEqualObjects(@"+541187654321", [phoneUtil stringWithPhoneNumber:arNumber format:LPNE164PhoneNumberFormat], @"Should correctly E164 format phone numbers.");
    
    
    STAssertEqualObjects(@"011 15 8765-4321", [phoneUtil stringWithPhoneNumber:arMobile format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+54 9 11 8765 4321", [phoneUtil stringWithPhoneNumber:arMobile format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    STAssertEqualObjects(@"+5491187654321", [phoneUtil stringWithPhoneNumber:arMobile format:LPNE164PhoneNumberFormat], @"Should correctly E164 format phone numbers.");
}



- (void)testFormatMXNumber
{
    STAssertEqualObjects(@"045 234 567 8900", [phoneUtil stringWithPhoneNumber:mxMobile1 format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+52 1 234 567 8900", [phoneUtil stringWithPhoneNumber:mxMobile1 format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    STAssertEqualObjects(@"+5212345678900", [phoneUtil stringWithPhoneNumber:mxMobile1 format:LPNE164PhoneNumberFormat], @"Should correctly E164 format phone numbers.");
    
    
    STAssertEqualObjects(@"045 55 1234 5678", [phoneUtil stringWithPhoneNumber:mxMobile2 format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+52 1 55 1234 5678", [phoneUtil stringWithPhoneNumber:mxMobile2 format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    STAssertEqualObjects(@"+5215512345678", [phoneUtil stringWithPhoneNumber:mxMobile2 format:LPNE164PhoneNumberFormat], @"Should correctly E164 format phone numbers.");


    STAssertEqualObjects(@"01 33 1234 5678", [phoneUtil stringWithPhoneNumber:mxNumber1 format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+52 33 1234 5678", [phoneUtil stringWithPhoneNumber:mxNumber1 format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    STAssertEqualObjects(@"+523312345678", [phoneUtil stringWithPhoneNumber:mxNumber1 format:LPNE164PhoneNumberFormat], @"Should correctly E164 format phone numbers.");
    
    
    STAssertEqualObjects(@"01 821 123 4567", [phoneUtil stringWithPhoneNumber:mxNumber2 format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+52 821 123 4567", [phoneUtil stringWithPhoneNumber:mxNumber2 format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    STAssertEqualObjects(@"+528211234567", [phoneUtil stringWithPhoneNumber:mxNumber2 format:LPNE164PhoneNumberFormat], @"Should correctly E164 format phone numbers.");
}


- (void)testFormatOutOfCountryCallingNumber
{
    STAssertEqualObjects(@"00 1 900 253 0000", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:usPremium region:@"DE"], @"Should properly format out of country calling number strings for premium numbers.");

    STAssertEqualObjects(@"1 650 253 0000", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:usNumber region:@"BS"], @"Should properly format out of country calling number strings.");

    STAssertEqualObjects(@"00 1 650 253 0000", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:usNumber region:@"PL"], @"Should properly format out of country calling number strings.");
    
    STAssertEqualObjects(@"011 44 7912 345 678", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:gbMobile region:@"US"], @"Should properly format out of country calling number strings.");
    
    STAssertEqualObjects(@"00 49 1234", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:deShortNumber region:@"GB"], @"Should properly format out of country calling number strings.");
    
    STAssertEqualObjects(@"1234", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:deShortNumber region:@"DE"], @"Should properly format out of country calling number strings.");
    
    STAssertEqualObjects(@"011 39 02 3661 8300", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:itNumber region:@"US"], @"Should properly format out of country calling number strings.");
    
    STAssertEqualObjects(@"02 3661 8300", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:itNumber region:@"IT"], @"Should properly format out of country calling number strings.");
    
    STAssertEqualObjects(@"+39 02 3661 8300", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:itNumber region:@"SG"], @"Should properly format out of country calling number strings.");
    
    STAssertEqualObjects(@"6521 8000", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:sgNumber region:@"SG"], @"Should properly format out of country calling number strings.");
    
    STAssertEqualObjects(@"011 54 9 11 8765 4321", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:arMobile region:@"US"], @"Should properly format out of country calling number strings.");
    
    LPNPhoneNumber *arNumberWithExtension = [arNumber copy];
    arNumberWithExtension.extension = @"1234";
    
    STAssertEqualObjects(@"011 54 9 11 8765 4321 ext. 1234", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:arNumberWithExtension region:@"US"], @"Should properly format out of country calling number strings.");
    
    STAssertEqualObjects(@"0011 54 9 11 8765 4321 ext. 1234", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:arNumberWithExtension region:@"AU"], @"Should properly format out of country calling number strings.");
    
    STAssertEqualObjects(@"011 15 8765-4321 ext. 1234", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:arNumberWithExtension region:@"AR"], @"Should properly format out of country calling number strings.");
    
}


- (void)testFormatOutOfCountryWithPreferredIntlPrefix
{
    STAssertEqualObjects(@"0011 39 02 3661 8300", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:itNumber region:@"AU"], @"Should use the preferred international prefix.");
}


- (void)testFormatOutOfCountryKeepingAlphaCharacters
{
    LPNPhoneNumber *alphaNumericNumber = [[LPNPhoneNumber alloc] init];
    alphaNumericNumber.countryCode = 1;
    alphaNumericNumber.nationalNumber = 8007493524;
    alphaNumericNumber.rawInput = @"1800 six-flag";
    
    STAssertEqualObjects(@"0011 1 800 SIX-FLAG", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"AU" keepAlphaCharacters:YES], @"Should format properly with alpha characters.");

    alphaNumericNumber.rawInput = @"1-800-SIX-flag";
    STAssertEqualObjects(@"0011 1 800 SIX-FLAG", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"AU" keepAlphaCharacters:YES], @"Should format properly with alpha characters.");
    
    alphaNumericNumber.rawInput = @"Call us from UK: 00 1 800 SIX-flag";
    STAssertEqualObjects(@"0011 1 800 SIX-FLAG", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"AU" keepAlphaCharacters:YES], @"Should format properly with alpha characters.");
    
    alphaNumericNumber.rawInput = @"800 SIX-flag";
    STAssertEqualObjects(@"0011 1 800 SIX-FLAG", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"AU" keepAlphaCharacters:YES], @"Should format properly with alpha characters.");
    
    STAssertEqualObjects(@"1 800 SIX-FLAG", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"US" keepAlphaCharacters:YES], @"Should format properly with alpha characters.");
    
    STAssertEqualObjects(@"1 800 SIX-FLAG", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"BS" keepAlphaCharacters:YES], @"Should format properly with alpha characters.");
    
    alphaNumericNumber.rawInput = nil;
    STAssertEqualObjects(@"00 1 800 749 3524", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"DE" keepAlphaCharacters:YES], @"Should format properly without raw input.");
    
    alphaNumericNumber.countryCode = 61;
    alphaNumericNumber.nationalNumber = 827493524;
    alphaNumericNumber.rawInput = @"+61 82749-FLAG";
    STAssertEqualObjects(@"082749-FLAG", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"AU" keepAlphaCharacters:YES], @"Should have the national prefix fixed.");
    
    alphaNumericNumber.rawInput = @"082749-FLAG";
    STAssertEqualObjects(@"082749-FLAG", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"AU" keepAlphaCharacters:YES], @"Should have the national prefix fixed.");
    
    
    alphaNumericNumber.nationalNumber = 18007493524;
    alphaNumericNumber.rawInput = @"1-800-SIX-flag";
    STAssertEqualObjects(@"1-800-SIX-FLAG", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"AU" keepAlphaCharacters:YES], @"Should not have the national prefix fixed.");
    
    alphaNumericNumber.nationalNumber = 1800749352;
    STAssertEqualObjects(@"1800 749 352", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"AU" keepAlphaCharacters:YES], @"Should not permanently change metadata.");


    STAssertEqualObjects(@"+61 1-800-SIX-FLAG", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"SG" keepAlphaCharacters:YES], @"Should work in regions with mutiple international prefixes.");
    
    
    alphaNumericNumber.countryCode = 0;
    alphaNumericNumber.nationalNumber = 18007493524;
    alphaNumericNumber.rawInput = @"1-800-SIX-flag";
    STAssertEqualObjects(@"1-800-SIX-flag", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"DE" keepAlphaCharacters:YES], @"Should use only raw input when country code is invalid.");
    
    alphaNumericNumber.countryCode = 1;
    alphaNumericNumber.nationalNumber = 80749;
    alphaNumericNumber.rawInput = @"180-SIX";
    STAssertEqualObjects(@"00 1 180-SIX", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"DE" keepAlphaCharacters:YES], @"");
    
}


- (void)testFormatWithCarrierCode
{
    // Only supported for AR in test data and only for mobile numbers starting with certain values.
    LPNPhoneNumber *arMobile = [[LPNPhoneNumber alloc] init];
    arMobile.countryCode = 54;
    arMobile.nationalNumber = 92234654321;
    STAssertEqualObjects(@"02234 65-4321", [phoneUtil stringWithPhoneNumber:arMobile format:LPNNationalPhoneNumberFormat], @"Should format properly with national format.");

    STAssertEqualObjects(@"02234 14 65-4321", [phoneUtil nationalNumberFormatForPhoneNumber:arMobile withCarrierCode:@"14"], @"Should format properly with carrier code.");
    STAssertEqualObjects(@"02234 65-4321", [phoneUtil nationalNumberFormatForPhoneNumber:arMobile withCarrierCode:nil], @"Should format properly with nil carrier code.");
    STAssertEqualObjects(@"02234 65-4321", [phoneUtil nationalNumberFormatForPhoneNumber:arMobile withCarrierCode:@""], @"Should format properly with empty carrier code.");
    
    STAssertEqualObjects(@"+5492234654321", [phoneUtil stringWithPhoneNumber:arMobile format:LPNE164PhoneNumberFormat], @"Should not include carrier code when the international rule is used.");
    
    STAssertEqualObjects(@"650 253 0000", [phoneUtil nationalNumberFormatForPhoneNumber:usNumber withCarrierCode:@"15"], @"Should not include carrier code when unsupported.");
}

- (void)testFormatWithPreferredCarrierCode
{
    // Only supported for AR in test data.
    LPNPhoneNumber *arNumber = [[LPNPhoneNumber alloc] init];
    arNumber.countryCode = 54;
    arNumber.nationalNumber = 91234125678;
    
    STAssertEqualObjects(@"01234 15 12-5678", [phoneUtil nationalNumberFormatForPhoneNumber:arNumber withPreferredCarrierCode:@"15"], @"Should format properly with no preferred carrier code stored in the number itself.");
    STAssertEqualObjects(@"01234 12-5678", [phoneUtil nationalNumberFormatForPhoneNumber:arNumber withPreferredCarrierCode:nil], @"Should format properly with no preferred carrier code stored in the number itself.");
    STAssertEqualObjects(@"01234 12-5678", [phoneUtil nationalNumberFormatForPhoneNumber:arNumber withPreferredCarrierCode:@""], @"Should format properly with no preferred carrier code stored in the number itself.");
    
    arNumber.preferredDomesticCarrierCode = @"19";
    
    STAssertEqualObjects(@"01234 12-5678", [phoneUtil stringWithPhoneNumber:arNumber format:LPNNationalPhoneNumberFormat], @"Should format properly with preferred carrier code present.");
    STAssertEqualObjects(@"01234 19 12-5678", [phoneUtil nationalNumberFormatForPhoneNumber:arNumber withPreferredCarrierCode:@"15"], @"Should format properly with preferred carrier code present.");
    STAssertEqualObjects(@"01234 19 12-5678", [phoneUtil nationalNumberFormatForPhoneNumber:arNumber withPreferredCarrierCode:nil], @"Should format properly with preferred carrier code present.");
    STAssertEqualObjects(@"01234 19 12-5678", [phoneUtil nationalNumberFormatForPhoneNumber:arNumber withPreferredCarrierCode:@""], @"Should format properly with preferred carrier code present.");
    
    arNumber.preferredDomesticCarrierCode = @"";
    
    STAssertEqualObjects(@"01234 12-5678", [phoneUtil nationalNumberFormatForPhoneNumber:arNumber withPreferredCarrierCode:@"15"], @"Should format properly with preferred carrier code set to an empty string.");
    
    LPNPhoneNumber *usNumberWithPreferredCC = [[LPNPhoneNumber alloc] init];
    usNumberWithPreferredCC.nationalNumber = 4241231234;
    usNumberWithPreferredCC.preferredDomesticCarrierCode = @"99";
    STAssertEqualObjects(@"424 123 1234", [phoneUtil stringWithPhoneNumber:usNumberWithPreferredCC format:LPNNationalPhoneNumberFormat], @"Should not include preferred carrier code when unsupported.");
    STAssertEqualObjects(@"424 123 1234", [phoneUtil nationalNumberFormatForPhoneNumber:usNumberWithPreferredCC withPreferredCarrierCode:@"15"], @"Should not include preferred carrier code when unsupported.");
}

- (void)testFormatNumberForMobileDialing
{
    // US toll free numbers are marked as no international dialing in the test data for testing purposes.
    
    STAssertEqualObjects(@"800 253 0000", [phoneUtil mobileDialingNumberFormatForPhoneNumber:usTollfree region:@"US" includeFormattingSymbols:YES], @"Should format properly for mobile dialing.");
    STAssertEqualObjects(@"", [phoneUtil mobileDialingNumberFormatForPhoneNumber:usTollfree region:@"CN" includeFormattingSymbols:YES], @"Should return an empty string for international mobile dialing when disallowed.");
    STAssertEqualObjects(@"+1 650 253 0000", [phoneUtil mobileDialingNumberFormatForPhoneNumber:usNumber region:@"US" includeFormattingSymbols:YES], @"Should format properly for mobile dialing.");
    
    LPNPhoneNumber *usNumberWithExtension = [usNumber copy];
    usNumberWithExtension.extension = @"1234";

    STAssertEqualObjects(@"+1 650 253 0000", [phoneUtil mobileDialingNumberFormatForPhoneNumber:usNumberWithExtension region:@"US" includeFormattingSymbols:YES], @"Should format properly for mobile dialing.");

    STAssertEqualObjects(@"8002530000", [phoneUtil mobileDialingNumberFormatForPhoneNumber:usTollfree region:@"US" includeFormattingSymbols:NO], @"Should format properly for mobile dialing.");
    STAssertEqualObjects(@"", [phoneUtil mobileDialingNumberFormatForPhoneNumber:usTollfree region:@"CN" includeFormattingSymbols:NO], @"Should return an empty string for international mobile dialing when disallowed.");
    STAssertEqualObjects(@"+16502530000", [phoneUtil mobileDialingNumberFormatForPhoneNumber:usNumber region:@"US" includeFormattingSymbols:NO], @"Should format properly for mobile dialing.");
    STAssertEqualObjects(@"+16502530000", [phoneUtil mobileDialingNumberFormatForPhoneNumber:usNumberWithExtension region:@"US" includeFormattingSymbols:NO], @"Should format properly for mobile dialing.");
}

- (void)testFormatByPattern
{
    LPNNumberFormat * numberFormat = [[LPNNumberFormat alloc] init];
    numberFormat.pattern = @"(\\d{3})(\\d{3})(\\d{4})";
    numberFormat.format = @"($1) $2-$3";
    
    STAssertEqualObjects(@"(650) 253-0000", [phoneUtil stringWithPhoneNumber:usNumber format:LPNNationalPhoneNumberFormat pattern:numberFormat], @"Should format properly using a custom number format.");
    STAssertEqualObjects(@"+1 (650) 253-0000", [phoneUtil stringWithPhoneNumber:usNumber format:LPNInternationalPhoneNumberFormat pattern:numberFormat], @"Should format properly using a custom number format.");
    
    // $NP is set to '1' for the US. Here we check that for other NANPA countries the US rules are followed.
    numberFormat.nationalPrefixFormattingRule = @"$NP ($FG)";
    numberFormat.format = @"$1 $2-$3";
    
    STAssertEqualObjects(@"1 (242) 365-1234", [phoneUtil stringWithPhoneNumber:bsNumber format:LPNNationalPhoneNumberFormat pattern:numberFormat], @"Should properly format using a custom number format.");
    STAssertEqualObjects(@"+1 242 365-1234", [phoneUtil stringWithPhoneNumber:bsNumber format:LPNInternationalPhoneNumberFormat pattern:numberFormat], @"Should properly format using a custom number format.");
    
    numberFormat.pattern = @"(\\d{2})(\\d{5})(\\d{3})";
    numberFormat.format = @"$1-$2 $3";
    
    STAssertEqualObjects(@"02-36618 300", [phoneUtil stringWithPhoneNumber:itNumber format:LPNNationalPhoneNumberFormat pattern:numberFormat], @"Should properly format using a custom number format.");
    STAssertEqualObjects(@"+39 02-36618 300", [phoneUtil stringWithPhoneNumber:itNumber format:LPNInternationalPhoneNumberFormat pattern:numberFormat], @"Should properly format using a custom number format.");
    
    numberFormat.nationalPrefixFormattingRule = @"$NP$FG";
    numberFormat.pattern = @"(\\d{2})(\\d{4})(\\d{4})";
    numberFormat.format = @"$1 $2 $3";
    
    STAssertEqualObjects(@"020 7031 3000", [phoneUtil stringWithPhoneNumber:gbNumber format:LPNNationalPhoneNumberFormat pattern:numberFormat], @"Should properly format using a custom number format.");
    
    numberFormat.nationalPrefixFormattingRule = @"($NP$FG)";
    
    STAssertEqualObjects(@"(020) 7031 3000", [phoneUtil stringWithPhoneNumber:gbNumber format:LPNNationalPhoneNumberFormat pattern:numberFormat], @"Should properly format using a custom number format.");
    
    numberFormat.nationalPrefixFormattingRule = @"";
    
    STAssertEqualObjects(@"20 7031 3000", [phoneUtil stringWithPhoneNumber:gbNumber format:LPNNationalPhoneNumberFormat pattern:numberFormat], @"Should properly format using a custom number format.");
    STAssertEqualObjects(@"+44 20 7031 3000", [phoneUtil stringWithPhoneNumber:gbNumber format:LPNInternationalPhoneNumberFormat pattern:numberFormat], @"Should properly format using a custom number format.");
}

- (void)testFormatE164Number
{
    STAssertEqualObjects(@"+16502530000", [phoneUtil stringWithPhoneNumber:usNumber format:LPNE164PhoneNumberFormat], @"Should properly format using E164 format.");
    STAssertEqualObjects(@"+4930123456", [phoneUtil stringWithPhoneNumber:deNumber format:LPNE164PhoneNumberFormat], @"Should properly format using E164 format.");
}

- (void)testFormatNumberWithExtension
{
    LPNPhoneNumber *nzNumberWithExtension = [nzNumber copy];
    nzNumberWithExtension.extension = @"1234";
    
    STAssertEqualObjects(@"03-331 6005 ext. 1234", [phoneUtil stringWithPhoneNumber:nzNumberWithExtension format:LPNNationalPhoneNumberFormat], @"Should properly format using default extension prefix.");
    
    STAssertEqualObjects(@"+64-3-331-6005;ext=1234", [phoneUtil stringWithPhoneNumber:nzNumberWithExtension format:LPNRFC3966PhoneNumberFormat], @"Should properly format using RFC 3966 syntax");
    
    LPNPhoneNumber *usNumberWithExtension = [usNumber copy];
    usNumberWithExtension.extension = @"4567";
    
    STAssertEqualObjects(@"650 253 0000 extn. 4567", [phoneUtil stringWithPhoneNumber:usNumberWithExtension format:LPNNationalPhoneNumberFormat], @"Should properly format using extension prefix overridden in the territory information for the US.");
}

- (void)testFormatUsingOriginalNumberFormat
{
    LPNPhoneNumber *number1 = [phoneUtil phoneNumberByParsingString:@"+442087654321" defaultRegion:@"GB" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"+44 20 8765 4321", [phoneUtil stringInOriginalFormatWithPhoneNumber:number1 region:@"GB"], @"Should properly format using original number format.");

    LPNPhoneNumber *number2 = [phoneUtil phoneNumberByParsingString:@"02087654321" defaultRegion:@"GB" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"(020) 8765 4321", [phoneUtil stringInOriginalFormatWithPhoneNumber:number2 region:@"GB"], @"Should properly format using original number format.");
    
    LPNPhoneNumber *number3 = [phoneUtil phoneNumberByParsingString:@"011442087654321" defaultRegion:@"GB" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"011 44 20 8765 4321", [phoneUtil stringInOriginalFormatWithPhoneNumber:number3 region:@"GB"], @"Should properly format using original number format.");
    
    LPNPhoneNumber *number4 = [phoneUtil phoneNumberByParsingString:@"442087654321" defaultRegion:@"GB" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"44 20 8765 4321", [phoneUtil stringInOriginalFormatWithPhoneNumber:number4 region:@"GB"], @"Should properly format using original number format.");
    
    LPNPhoneNumber *number5 = [phoneUtil phoneNumberByParsingString:@"+442087654321" defaultRegion:@"GB" keepingRawInput:NO error:NULL];
    STAssertEqualObjects(@"(020) 8765 4321", [phoneUtil stringInOriginalFormatWithPhoneNumber:number5 region:@"GB"], @"Should properly format using original number format.");
    
    
    // Invalid numbers should be formatted using their raw input when available.
    // Note area codes starting with 7 are intentionally excluded in the test data.
    LPNPhoneNumber *number6 = [phoneUtil phoneNumberByParsingString:@"7345678901" defaultRegion:@"US" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"7345678901", [phoneUtil stringInOriginalFormatWithPhoneNumber:number6 region:@"US"], @"Should properly format using original number format.");
    
    LPNPhoneNumber *number7 = [phoneUtil phoneNumberByParsingString:@"7345678901" defaultRegion:@"US" keepingRawInput:NO error:NULL];
    STAssertEqualObjects(@"734 567 8901", [phoneUtil stringInOriginalFormatWithPhoneNumber:number7 region:@"US"], @"Should properly format when raw input is unavailable.");
    
}

@end
