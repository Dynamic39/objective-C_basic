//
//  Complex.h
//  FractionTest
//
//  Created by Samuel K on 2018. 4. 10..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Complex : NSObject

@property double real, imaginary;
-(void)print;
-(void)setReal:(double)a andImaginary:(double)b;
-(Complex *) add:(Complex*)f;

@end


