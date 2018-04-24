//
//  Rectangle.m
//  proj8-2dgraphics
//
//  Created by Samuel K on 2018. 4. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "Rectangle.h"


@implementation Rectangle
{
  XYPoint *origin;
}

@synthesize width, height;

- (XYPoint *)origin
{
  return origin;
}

- (void)setOrigin:(XYPoint *)pt
{
  if (!origin)
    origin = [[XYPoint alloc] init];
  
  origin.x = pt.x;
  origin.y = pt.y;
  
  //[origin setX:pt.x andY:pt.y];
}

- (void)setWidth:(int)w andHeight:(int)h
{
  width = w;
  height = h;
}

- (int)area
{
  return width * height;
}

-(int) perimeter
{
  return (width + height) * 2;
}

@end
