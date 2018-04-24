//
//  main.m
//  proj1
//
//  Created by Samuel K on 2018. 4. 6..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  //메모리 관리를 위해서 아래 스코프 내에서 코드가 작성되어야 한다.
  @autoreleasepool {
    
    NSLog(@"In Objective-C, lowercase are significant.\nmain is where program excution begins.");
    NSLog(@"Open and closed braces enclose program statement in a routine.");
    NSLog(@"All Program statements must be terminated by semicolon.");
    
    int i;
    i = 1;
    NSLog(@"Testing...");
    NSLog(@"....%i", i);
    NSLog(@"...%i", i+1);
    NSLog(@"..%i", i+2);
    
    int value1, value2, sum;
    value1 = 87;
    value2 = 15;
    sum = value1 - value2;
    
    NSLog(@"%i 마이너스 %i 는 %i 입니다!", value1, value2, sum);
    
    int sum1;
    /* COMPUTE RESULT */
    sum1 = 25 + 37 - 19;
    // DISPLAY RESULTS
    NSLog(@"The answer is %i", sum1);

  }
  
  return 0;
}

