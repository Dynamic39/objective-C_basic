//
//  StringOperation.m
//  DispatchSample
//
//  Created by Samuel K on 2018. 5. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "StringOperation.h"

@implementation StringOperation

//초기화
- (instancetype)initWithUrlString:(NSString *)urlStr
{
  self = [super init];
  
  if (self) {
    _targerUrl = [NSURL URLWithString:urlStr];
  }
  
  return self;
  
}

-(void)main {
  @autoreleasepool {
    
    if (self.isCancelled) {
      return;
    }
    
    if (self.targerUrl) {
      NSError *error = nil;
      NSString *str = [NSString stringWithContentsOfURL:self.targerUrl encoding:NSUTF8StringEncoding error:&error];
      
      if (self.isCancelled) {
        return;
      }
      
      if (!error) {
        
        NSArray *list = [str componentsSeparatedByString:@"\n"];
        
        
        if (self.isCancelled) {
          return;
        }
        
        for (NSString* str in list) {
          if (self.isCancelled) {
            return;
          }
          
          NSString *trimmedString = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
          
          if ([trimmedString length] > 5) {
            trimmedString = [trimmedString substringToIndex:4];
          }
          
          NSLog(@"%@ => %@", trimmedString, trimmedString.uppercaseString);
          
          [NSThread sleepForTimeInterval:0.003];
        }
      }
    }
  }
  
}

@end
