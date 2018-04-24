//
//  main.m
//  proj4-calculator
//
//  Created by Samuel K on 2018. 4. 7..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>

//클래스 선언부 및 메서드 작성부분
@interface Calculator: NSObject

//누산기 메서드
-(void) setAccumulator: (double) value;
-(void) clear;
-(double) accumulator;

//산술 연산 메서드
-(void)add:(double) value ;
-(void)subtract:(double) value;
-(void)multifly:(double) value;
-(void)divide:(double) value;

//추가 기능 구현
-(double) changeSign; //누산기 부호 바꾸기
-(double) reciprocal; //1/누산기
-(double) xSquared; //누산기 제고

//메모리 관련 기능 구현
-(double) memoryClear; // 메모리 값 정리
-(double) memoryStore; // 누산기 값을 메모리에 저장
-(double) recall; // 메모리에 값을 누산기에 지정한다.
-(double) memoryAdd:(double) value; // 메모리에서 값을 더한다
-(double) memorySbtract:(double) value; // 메모리에서 값을 뺀다

@end

//클래스 실행부, 메서드 세부내용 작성부분
@implementation Calculator
{
  double accumulator;
  double memoryValue;
}

-(double)memorySbtract:(double)value
{
  return memoryValue -= accumulator;
}

-(double)memoryAdd:(double)value
{
  return memoryValue += accumulator;
}

-(double) recall
{
  return accumulator = memoryValue;
}

-(double) memoryStore
{
  return memoryValue = accumulator;
}

-(double)memoryClear
{
  return memoryValue = 0;
}

-(double) changeSign
{
  return -accumulator;
}

-(double) reciprocal
{
  return 1/accumulator;
}

-(double) xSquared
{
  return accumulator *= accumulator;
}

-(void) setAccumulator:(double)value
{
  accumulator = value;
}

-(void) clear
{
  accumulator = 0;
}

-(double) accumulator
{
  return accumulator;
}

-(void)add:(double)value
{
  accumulator += value;
  NSLog(@"The add result is %g", accumulator);
}

-(void)subtract:(double)value
{
  accumulator -= value;
  NSLog(@"The subtract result is %g", accumulator);
}

-(void)multifly:(double)value
{
  accumulator *= value;
  NSLog(@"The multifly result is %g", accumulator);
}

-(void)divide:(double)value
{
  if (value != 0.0)
  {
    accumulator /= value;
    NSLog(@"The divide result is %g", accumulator);
  }
  else
  {
    NSLog(@"Division by zero");
    accumulator = NAN;
  }
}

@end

//프로그램 실행부분
int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    //클래스 인스턴스 생성
    double value1, value2;
    char operator;
    Calculator *deskCalc = [[Calculator alloc] init];
    
    NSLog(@"Type in your experssion.");
    scanf("%lf %c %lf", &value1, &operator, &value2);
    
    [deskCalc setAccumulator: value1];
    
//    if (operator == '+')
//      [deskCalc add:value2];
//    else if (operator == '-')
//      [deskCalc subtract:value2];
//    else if (operator == '*')
//      [deskCalc multifly:value2];
//    else if (operator == '/')
//        [deskCalc divide:value2];
//    else
//      NSLog(@"Unknwon operator");
    
    //Switch 문으로 전환
    switch (operator) {
        
      case '+':
        [deskCalc add: value2];
        break;
      case '-':
        [deskCalc subtract:value2];
        break;
      case '*':
        [deskCalc multifly:value2];
        break;
      case '/':
        [deskCalc divide:value2];
        break;
      default:
        NSLog(@"Unknon Operator");
        break;   
    }
    
    
    NSLog(@"%.2f", [deskCalc accumulator]);
    
    
    
  }
  return 0;
}
