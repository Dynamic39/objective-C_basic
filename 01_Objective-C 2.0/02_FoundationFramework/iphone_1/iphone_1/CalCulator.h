//
//  CalCulator.h
//  iphone_1
//
//  Created by Samuel K on 2018. 4. 12..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

@interface CalCulator : NSObject

@property (strong, nonatomic) Fraction *operand1, *operand2, *accumulator;

-(Fraction *)perfomOperation: (char)op;
-(void) clear;

@end
