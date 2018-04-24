//
//  Fraction+MathOps.h
//  FractionTest
//
//  Created by Samuel K on 2018. 4. 10..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "Fraction.h"

@interface Fraction (MathOps)

- (Fraction *)add:(Fraction *)f;
- (Fraction *)mul:(Fraction *)f;
- (Fraction *)sub:(Fraction *)f;
- (Fraction *)div:(Fraction *)f;


@end
