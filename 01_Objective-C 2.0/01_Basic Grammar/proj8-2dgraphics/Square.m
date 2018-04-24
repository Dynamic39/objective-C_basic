//
//  Square.m
//  proj8-2dgraphics
//
//  Created by Samuel K on 2018. 4. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "Square.h"

@implementation Square

- (void)setSide:(int)s
{
  [self setWidth:s andHeight:s];
}

- (int)side
{
  return self.width;
}

@end
