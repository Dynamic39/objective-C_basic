//
//  main.m
//  proj6-if,switch,conditional
//
//  Created by Samuel K on 2018. 4. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    int number;
    NSLog(@"Type in your number");
    scanf("%i", &number);
    
    if (number < 0)
      number = -number;
    
    NSLog(@"The absoulute value is %i", number);
    
  }
  return 0;
}
