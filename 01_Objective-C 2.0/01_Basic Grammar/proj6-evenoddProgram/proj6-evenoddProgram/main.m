//
//  main.m
//  proj6-evenoddProgram
//
//  Created by Samuel K on 2018. 4. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
//    int number_to_rest, remainder;
//
//    NSLog(@"Enter your number to be tested: ");
//    scanf("%i", &number_to_rest);
//    remainder = number_to_rest % 2;
//
//    if (remainder == 0)
//      NSLog(@"The number is even.");
//    else
//      NSLog(@"The number is odd.");
    
    //윤년 프로그램 정리
//    int year, rem_4, rem_100, rem_400;
//
//    NSLog(@"Enter the year to be tested");
//    scanf("%i", &year);
//
//    rem_4 = year % 4;
//    rem_100 = year % 100;
//    rem_400 = year % 400;
//
//    if ((rem_4 == 0 && rem_100 != 0) || rem_400 == 0)
//      NSLog(@"It's a leap year");
//    else
//      NSLog(@"Nope It's not a leap year.");
    
    //부호 함수를 구현하는 프로그램
//    int number, sign;
//    NSLog(@"Please type in a number");
//    scanf("%i", &number);
//
//    if (number < 0)
//      sign = -1;
//    else if (number == 0)
//      sign = 0;
//    else
//      sign = 1;
//
//    NSLog(@"Sign = %i", sign);
    
    //문자 분석기
//    char c;
//    NSLog(@"Enter a single character: ");
//    scanf(" %c", &c);
//
//    if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))
//      NSLog(@"It's an alphabetic character.");
//    else if (c >= '0' && c <= '9')
//      NSLog(@"It's a digit");
//    else
//      NSLog(@"It's a special character");
    
    // 불리언 변수를 이용한 소수 찾기
    int p, d;
    BOOL isPrime;
    
    for (p = 2; p <= 50; ++p)
    {
      isPrime = YES;
      for (d = 2; d < p; ++d)
        if ( p % d == 0)
          isPrime = NO;
      
      if (isPrime != YES) {
        NSLog(@"%i", p);
        
      }
    }
    
    
  }
  return 0;
}
