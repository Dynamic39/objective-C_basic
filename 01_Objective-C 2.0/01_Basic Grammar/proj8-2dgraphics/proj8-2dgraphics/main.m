//
//  main.m
//  proj8-2dgraphics
//
//  Created by Samuel K on 2018. 4. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"
#import "Square.h"
#import "XYPoint.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
//    Rectangle *myRect = [[Rectangle alloc] init];
//    XYPoint *myPoint = [[XYPoint alloc] init];
//
//    [myPoint setX:100 andY:200];
//    [myRect setWidth:5 andHeight:8];
//
//    myRect.origin = myPoint;
//
//    NSLog(@"Origin at (%i, %i)", myRect.origin.x, myRect.origin.y);
//
//    [myPoint setX:50 andY:50];
//    NSLog(@"Origin at (%i, %i)", myRect.origin.x, myRect.origin.y);
    
    //클래스에 질문하기
    
    Square *mySquare = [[Square alloc] init];
    
    if ([mySquare isMemberOfClass:[Square class]] == YES)
      NSLog(@"mySquare is a member of Square class");
    
    if ([mySquare isMemberOfClass:[Rectangle class]] == YES)
      NSLog(@"mySquare is a member of Rectangle class");
    
    if ([mySquare isMemberOfClass:[NSObject class]] == YES)
      NSLog(@"mySquare is a member of NSObject class");
    
    if ([mySquare isKindOfClass:[Square class]] == YES)
      NSLog(@"mySquare is a kind of Square");

    if ([mySquare isKindOfClass:[Rectangle class]] == YES)
      NSLog(@"mySquare is a member of Rectangle");
    
    if ([mySquare isKindOfClass:[NSObject class]] == YES)
      NSLog(@"mySquare is a member of NSObject");
    
    
    //response to
    
    if ([mySquare respondsToSelector:@selector(setSide:)] == YES)
      NSLog(@"mySquare response to setSide: method");
    
    if ([mySquare respondsToSelector:@selector(setWidth:andHeight:)] == YES)
      NSLog(@"mySquare response to setWidth:andHeight: method");
    
    if ([mySquare respondsToSelector:@selector(alloc)] == YES)
      NSLog(@"mySquare response to alloc method");
    
    //instanceResponseTo
    
    if ([Rectangle instancesRespondToSelector:@selector(setSide:)] == YES)
      NSLog(@"Instances of Square respond to setSide: method");
    
    if ([Square instancesRespondToSelector:@selector(setSide:)] == YES)
      NSLog(@"Instances of Square respond to setSide: method");
    
    if ([Square isSubclassOfClass:[Rectangle class]] == YES)
      NSLog(@"Square is a subclass of a rectangle");
    
  
    
    
    
    
    
  }
  
  return 0;
  
}
