//
//  main.m
//  proj5-if&for
//
//  Created by Samuel K on 2018. 4. 7..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    //중첩 for문 작성하기
//    int n, number, trianglelarNumber, counter;
    
    
//    for (counter = 1; counter <= 5; ++ counter)
//    {
//      NSLog(@"What triangular number do you want?");
//      scanf("%i", &number);
//
//      trianglelarNumber = 0;
//
//      //해당 문서를 for문으로 바꿔서 진행하여 보자
//      for (n = 1; n <= number; ++n)
//        trianglelarNumber += n;
//      NSLog(@"Triangular number %i is %i\n", number,trianglelarNumber);
//    }
    
//    //while문에 대하여 정리
//    counter = 0;
//    while (counter <= 5)
//    {
//      NSLog(@"%i", counter);
//      ++counter;
//    }
    
    //최대 공약수 만들기
//    unsigned int u, v, temp;
//    NSLog(@"please type in two nonnegative integers");
//    scanf("%u%u", &u, &v);
//
//    while (v != 0) {
//      temp = u % v;
//      u = v;
//      v = temp;
//    }
//
//    NSLog(@"Their greatest common divisor is %u", u);
    
    //자릿수를 뒤집는 프로그램
    int number, rightDigit;
    
    NSLog(@"Enter your number");
    scanf("%i", &number);
    
    do
    {
      rightDigit = number % 10;
      NSLog(@"%i", rightDigit);
      number /= 10;
    }
    while (number != 0);
    
  }
  return 0;
}
