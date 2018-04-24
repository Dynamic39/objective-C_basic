//
//  main.m
//  FractionTest
//
//  Created by Samuel K on 2018. 4. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction+MathOps.h"
#import "Complex.h"

//@implementation Fraction (MathOps)
//
//- (Fraction *)add:(Fraction *)f
//{
//  Fraction *result = [[Fraction alloc] init];
//
//  result.numerator = (numerator * f.denominator) + (denominator * f.denominator);
//  result.denominator = denominator * f.denominator;
//  [result reduce];
//
//  return result;
//}
//
//@end

//@implementation Fraction (MathOps)
//
//- (Fraction *)add:(Fraction *)f
//{
//
//  Fraction *result = [[Fraction alloc] init];
//  result.numerator = (numerator * f.numerator) + (denominator * f.denominator);
//
//}
//
//@end

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    //클래스의 다형성
//    Fraction *f1 = [[Fraction alloc] init];
//    Fraction *f2 = [[Fraction alloc] init];
//
//    Fraction *fracRsult;
//
//    Complex *c1 = [[Complex alloc] init];
//    Complex *c2 = [[Complex alloc] init];
//
//    Complex *comResult;
//
//    [f1 setTo:1 over:10];
//    [f2 setTo:2 over:15];
//
//    [c1 setReal:18.0 andImaginary:2.5];
//    [c2 setReal:-5.0 andImaginary:3.2];
//
//    //두개의 복소수를 더하고 결과를 표시한다.
//    [c1 print];
//    NSLog(@"        +");
//    [c2 print];
//    NSLog(@"---------");
//    comResult = [c1 add:c2];
//    [comResult print];
//    NSLog(@"\n");
//
//    //두개의 분수를 더하고 결과를 표시한다.
//    [f1 print];
//    NSLog(@"   +");
//    [f2 print];
//    NSLog(@"----");
//    fracRsult = [f1 add:f2];
//    [fracRsult print];
    
    //동적 바인딩 및 id 형
    
//    id dataValue;
//    Fraction *f1 = [[Fraction alloc] init];
//    Complex *c1 = [[Complex alloc] init];
//
//    [f1 setTo:2 over:5];
//    [c1 setReal:10.0 andImaginary:2.5];
//
//    //dataValue에 분수를 대입한다.
//    dataValue = f1;
//    [dataValue print];
//
//    //dataValue에 복소수를 대입한다.
//    dataValue = c1;
//    [dataValue print];
    
    //@try를 사용한 예외처리
    
//    NSArray *myArray = [NSArray array];
//
//    @try
//    {
//      [myArray objectAtIndex:2];
//    }
//    @catch (NSException *exception)
//    {
//      NSLog(@"Caught %@%@", exception.name, exception.reason);
//    }
//
//    NSLog(@"Excution continues");
    
    //메서드를 이용하여 초기화 하기
    
//    Fraction *a, *b;
//
//    a = [[Fraction alloc] initWith:1 over:3];
//    b = [[Fraction alloc] initWith:3 over:7];
//
//
//    [a print];
//    [b print];
    
    //정적 변수 선언 관련 메서드
    
    Fraction *a, *b, *c;
    NSLog(@"Fractions allocated %i", [Fraction count]);
    
    a = [[Fraction allocF] init];
    b = [[Fraction allocF] init];
    c = [[Fraction allocF] init];
    
    NSLog(@"Fractions allocated: %i", [Fraction count]);
    
    [a setTo:2 over:4];
    [b setTo:2 over:5];
    
    Fraction *TestA = [[Fraction alloc] init];
    Fraction *TestB = [[Fraction alloc] init];
    Fraction *TestResult;
    
    [TestA setTo:5 over:10];
    [TestB setTo:3 over:4];
    
    NSLog(@"ddddd");
    TestResult = [TestA add:TestB];
    [TestResult print];
  
    
  }
  return 0;
}
