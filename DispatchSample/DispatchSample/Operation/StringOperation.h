//
//  StringOperation.h
//  DispatchSample
//
//  Created by Samuel K on 2018. 5. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringOperation : NSOperation

@property (strong, nonatomic) NSURL *targerUrl;

-(instancetype)initWithUrlString:(NSString *)urlStr;


@end
