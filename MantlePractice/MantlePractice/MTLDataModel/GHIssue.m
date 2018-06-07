//
//  GHIssue.m
//  MantlePractice
//
//  Created by Samuel K on 2018. 5. 29..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "GHIssue.h"

@implementation GHIssue

+(NSDateFormatter *)dateFormatter {
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    
    return dateFormatter;
    
}

+(NSValueTransformer *)URLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+(NSValueTransformer *)HTMLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+(NSValueTransformer *)stateJSONTransformer {
    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:@{
                                                                           @"open":@(GHIssueStateOpen),
                                                                           @"closed":@(GHIssueStateClosed)
                                                                           }];
}

+(NSValueTransformer *)assigneeJSONTransformer {
    return [MTLJSONAdapter  dictionaryTransformerWithModelClass:GHUser.class];
}

//+ (NSValueTransformer *)updatedAtJSONTransformer {
//    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
//        return [self.dateFormatter dateFromString:dateString];
//    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
//        return [self.dateFormatter stringFromDate:date];
//    }];
//}


+ (NSValueTransformer *)updatedAtJSONTransformer {
    
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
        
        return [self.dateFormatter dateFromString:dateString];
        
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter stringFromDate:date];
    }];
}


- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing *)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    
    //메서드 호출시 추가 정보가 필요하기 때문에 (instancetype)로 변형하여 하여준다.
    if (self == nil) return  nil;
    _retrievedAt = [NSDate  date];
    return self;
    
}




@end
