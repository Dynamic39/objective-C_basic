//
//  Fraction+MathOps.m
//  FractionTest
//
//  Created by Samuel K on 2018. 4. 10..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "Fraction+MathOps.h"


@implementation Fraction (MathOps)

- (Fraction *)add:(Fraction *)f
{
  Fraction *result = [[Fraction alloc] init];
  
  result.numerator = self.numerator;
  result.denominator = self.denominator;
  
  return result;
  
}
- (Fraction *)mul:(Fraction *)f
{
  return [[Fraction alloc] init];
}

- (Fraction *)sub:(Fraction *)f
{
  return [[Fraction alloc] init];
}

- (Fraction *)div:(Fraction *)f
{
  return [[Fraction alloc] init];
}

@end
