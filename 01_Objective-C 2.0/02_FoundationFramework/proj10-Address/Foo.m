//
//  Foo.m
//  proj10-Address
//
//  Created by Samuel K on 2018. 4. 12..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "Foo.h"

@implementation Foo

@synthesize strVal, intVal, floatVal;

- (void)encodeWithCoder:(NSCoder *)coder
{
  [coder encodeObject:strVal forKey:@"FoostVal"];
  [coder encodeInt:intVal forKey:@"FoointVal"];
  [coder encodeFloat:floatVal forKey:@"FoofloatVal"];
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
  strVal = [coder decodeObjectForKey:@"FoostVal"];
  intVal = [coder decodeIntForKey:@"FoointVal"];
  floatVal = [coder decodeFloatForKey:@"FoofloatVal"];
  
  return self;
}


@end
