//
//  SumOperation.m
//  DispatchSample
//
//  Created by Samuel K on 2018. 5. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "SumOperation.h"

@implementation SumOperation



- (instancetype)initWithData:(NSArray *)dataList
{
  self = [super init];
  if (self) {
    _result = 0;
    _list = dataList;
  }
  
  return self;
}

-(void)main {
  @autoreleasepool {
    for (NSNumber *num in self.list) {
      if (self.cancelled) {
        self.result = 0;
        return;
      }
      
      NSLog(@"Run Sum Opreation");
      
      self.result += [num integerValue];
      [NSThread sleepForTimeInterval:0.05];
    }
    
    
    
  }
}
@end
