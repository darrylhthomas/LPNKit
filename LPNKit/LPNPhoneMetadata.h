//
//  LPNPhoneMetadata.h
//  LPNKit
//
//  Created by Darryl Thomas on 11/15/11.
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

@class LPNPhoneNumberDescription;

@interface LPNPhoneMetadata : NSObject

@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, assign, readonly) NSUInteger countryCode;
@property (nonatomic, copy, readonly) NSString *internationalDialingPrefix;
@property (nonatomic, copy, readonly) NSString *nationalPrefix;
@property (nonatomic, copy) NSString *nationalPrefixForParsing;
@property (nonatomic, copy) NSString *nationalPrefixTransformRule;
@property (nonatomic, strong, readonly) NSArray *numberFormats;
@property (nonatomic, copy, readonly) NSArray *internationalNumberFormats;
@property (nonatomic, strong) LPNPhoneNumberDescription *generalDescription;
@property (nonatomic, strong, readonly) LPNPhoneNumberDescription *fixedLineDescription;
@property (nonatomic, strong, readonly) LPNPhoneNumberDescription *tollFreeDescription;
@property (nonatomic, strong, readonly) LPNPhoneNumberDescription *premiumRateDescription;
@property (nonatomic, strong, readonly) LPNPhoneNumberDescription *sharedCostDescription;

@end
