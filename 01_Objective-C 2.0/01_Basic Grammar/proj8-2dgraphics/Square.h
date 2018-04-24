//
//  Square.h
//  proj8-2dgraphics
//
//  Created by Samuel K on 2018. 4. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>

//Rectangle.h 를 import한다.

#import "Rectangle.h"

@interface Square : Rectangle

-(void) setSide: (int)s;
-(int) side;


@end
