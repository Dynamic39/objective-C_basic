//
//  main.m
//  proj2-Class&Method
//
//  Created by Samuel K on 2018. 4. 6..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>


//@interface부분
//클래스 메서드 선언부, 인스턴스 변수 선언도 가능해짐

@interface Fraction: NSObject

-(void) print;
-(void) setNumerator: (int) n;
-(void) setDenominator: (int) d;
-(int) numerator;
-(int) denominator;
-(double)convertToNum;


@end

//@implementation 부분
//데이터 요소(클래스에 담을 인스턴스 변수)와 메서드들을 구성하는 실제 코드가 담겨있음
@implementation Fraction
{
  int numerator;
  int denominator;
}

-(double)convertToNum
{
  if (denominator != 0)
    return (double)numerator / denominator;
  else
    return NAN;
}

-(void)print
{
  NSLog(@"%i/%i", numerator, denominator);
}

-(void)setNumerator:(int)n
{
  numerator = n;
}

-(void)setDenominator:(int)d
{
  denominator = d;
}

-(int)numerator
{
  return numerator;
}

-(int)denominator
{
  return denominator;
}

@end


//프로그램 부분
//프로그램이 달성하려는 목적을 실행하는 코드가 담겨있음
int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    //Fraction 인스턴스를 생성한다
    //Fraction *myFraction = [[Fraction alloc] init];
    Fraction *myFraction = [Fraction new];

    
    //1/3로 분수값을 설정한다.
    [myFraction setNumerator:1];
    [myFraction setDenominator:3];
    
    //print method로 분수값을 표시한다.
    NSLog(@"The value of myFraction is:");
    [myFraction print];
    
    //두개의 클래스 인스턴스를 생성하여 보자
    
    Fraction *frac1 = [[Fraction alloc] init];
    Fraction *frac2 = [[Fraction alloc] init];
    
    //각각의 인스턴스 클래스의 값을 넣어준다.
    [frac1 setNumerator:2];
    [frac1 setDenominator:3];
    
    [frac2 setNumerator:3];
    [frac2 setDenominator:7];
    
    //분수를 표시한다.
    NSLog(@"First Fraction is:");
    [frac1 print];
    
    NSLog(@"Second Fraction is:");
    [frac2 print];
    
    //int 를 반환하는 분자 분모 타입의 인스턴스 메서드를 가지고온다.
    NSLog(@"The value of My Fraction is: %i/%i", [myFraction numerator], [myFraction denominator]);
    
    Fraction *aFraction = [[Fraction alloc] init];
    Fraction *bFraction = [[Fraction alloc] init];
    
    [aFraction setNumerator:1];
    [aFraction setDenominator:4];
    
    [aFraction print];
    NSLog(@" =");
    NSLog(@"%g", [aFraction convertToNum]);
    
    [bFraction print];
    NSLog(@" =");
    NSLog(@"%g", [bFraction convertToNum]);
    
  }
  return 0;
}
