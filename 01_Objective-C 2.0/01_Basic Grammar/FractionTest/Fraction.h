//
//  Fraction.h
//  FractionTest
//
//  Created by Samuel K on 2018. 4. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>

//클래스 부분
@interface Fraction : NSObject

@property int numerator, denominator, testingNumber;

-(void) print;
-(void) setTo:(int) n over: (int) d;
-(double) convertTonum;
-(void) reduce;
-(id) initWith: (int)n over:(int)d;

+(Fraction *)allocF;
+(int) count;

@end

//@interface Fraction (MathOps)
//
//- (Fraction *)add:(Fraction *)f;
//- (Fraction *)mul:(Fraction *)f;
//- (Fraction *)sub:(Fraction *)f;
//- (Fraction *)div:(Fraction *)f;
//
//@end

