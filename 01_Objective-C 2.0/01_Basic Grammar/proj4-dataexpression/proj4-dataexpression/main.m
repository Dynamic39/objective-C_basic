//
//  main.m
//  proj4-dataexpression
//
//  Created by Samuel K on 2018. 4. 6..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    int integerVar = 100;
    float floationgVar = 331.79;
    double doubleVar = 8.33e+11;
    char charVar = 'd';
    
    NSLog(@"integerVar = %i", integerVar);
    NSLog(@"floatingVar = %f", floationgVar);
    NSLog(@"doubleVar = %e", doubleVar);
    NSLog(@"doubleVar = %g", doubleVar);
    NSLog(@"charVar = %c", charVar);
    
    int a = 25, b = 5, c = 10, d = 7;
    
    NSLog(@"a %% b = %i", a % b);
    NSLog(@"a %% c = %i", a % c);
    NSLog(@"a %% d = %i", a % d);
    
  }
  
  return 0;
}
