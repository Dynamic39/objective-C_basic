//
//  AvgOperation.m
//  DispatchSample
//
//  Created by Samuel K on 2018. 5. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "AvgOperation.h"

@implementation AvgOperation

- (instancetype)initWithData:(NSArray *)dataList {
  self = [super init];
  if (self) {
    _result = 0;
    _list = dataList;
  }
  return self;
}

-(void)main {
  @autoreleasepool {
    int sum = 0;
    
    for (NSNumber *num in self.list) {
      if (self.isCancelled) {
        self.result = 0.0;
        return;
      }
      
      NSLog(@"Run AVG Operation...");
      sum += [num integerValue];
      [NSThread sleepForTimeInterval:0.05];
    }
    
    if (self.isCancelled) {
      self.result = 0.0;
      return;
    }
    
    self.result = sum / (double)self.list.count;
    
  }
  
  
}

@end
