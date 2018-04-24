//
//  main.m
//  proj8-ClassInheritance
//
//  Created by Samuel K on 2018. 4. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>

//클래스A 선언 및 정리
@interface ClassA: NSObject
{
  int x;
}
-(void) initVar;
-(void) printVar;

@end

@implementation ClassA
- (void)initVar
{
  x = 100;
}

- (void)printVar
{
  NSLog(@"x = %i", x);
}


@end

//클래스B 선언 및 정리

@interface ClassB: ClassA

@end

@implementation ClassB


-(void)initVar
{
  x = 200;
}

@end

int main(int argc, const char * argv[]) {
  @autoreleasepool {
   
    ClassA *a = [[ClassA alloc] init];
    ClassB *b = [[ClassB alloc] init];
    
    //a클래스를 확인하여 본다
    [a initVar];
    [a printVar];
    
    //상속받은 메서드를 사용한다.
    //상위클래스에서 받은 메서드를 재정의 할 수 있다.
    [b initVar];
    //원래 가지고 있는 메서드를 사용한다.
    [b printVar];
    
  }
  return 0;
}
