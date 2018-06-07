//
//  HTTPService.m
//  DevslopesTutorials
//
//  Created by Samuel K on 2018. 5. 4..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "HTTPService.h"

@implementation HTTPService

+ (id)instance {
  static HTTPService *sharedInstance = nil;
  @synchronized(self) {
    if (sharedInstance == nil)
      sharedInstance = [[self alloc] init];
  }
  return sharedInstance;
  
}



@end
