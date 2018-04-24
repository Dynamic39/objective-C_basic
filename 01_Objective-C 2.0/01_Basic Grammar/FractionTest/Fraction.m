//
//  Fraction.m
//  FractionTest
//
//  Created by Samuel K on 2018. 4. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "Fraction.h"

static int gCounter;

@implementation Fraction

@synthesize numerator, denominator;

+ (Fraction *)allocF
{
  extern int gCounter;
  ++gCounter;
  
  return [Fraction alloc];
}

+ (int)count
{
  extern int gCounter;
  return gCounter;
}

- (id)initWith:(int)n over:(int)d
{
  self = [super init];
  
  if (self)
    [self setTo:n over:d];
  
  return self;
}

- (void)reduce
{
  int u = numerator;
  int v = denominator;
  int temp;
  
  while ( v != 0) {
    temp = u % v;
    u = v;
    v = temp;
  }
  
  numerator /= u;
  denominator /= u;
  
}

//- (Fraction *)add:(Fraction *)f
//{
//  //두분수 더하기
//  // a/b + c/d = (a*d)+(b*c)/(b*d)
//
//  Fraction *result = [[Fraction alloc] init];
//
//  result.numerator = numerator * f.denominator + denominator * f.numerator;
//  result.denominator = denominator * f.denominator;
//
//  [result reduce];
//
//  return result;
//
//}

- (void)setTo:(int)n over:(int)d
{
  
  numerator = n;
  denominator = d;
  
}
- (void)print
{
  NSLog(@"%i/%i", numerator, denominator);
}

- (double)convertTonum
{
  if (denominator != 0)
    return (double) numerator / denominator;
  else
    return NAN;
}

@end

//@implementation Fraction (MathOps)
//
//- (Fraction *)add:(Fraction *)f
//{
//  Fraction *result = [[Fraction alloc] init];
//
//  result.numerator = (numerator * f.denominator) + (denominator * f.denominator);
//  result.denominator = denominator * f.denominator;
//
//  [result reduce];
//
//  return result;
//}
//
//@end


