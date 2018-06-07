//
//  TDDSampleTests.m
//  TDDSampleTests
//
//  Created by Samuel K on 2018. 5. 2..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Calculator.h"

@interface TDDSampleTests : XCTestCase

@end

@implementation TDDSampleTests

//- (void)setUp {
//    [super setUp];
//    // Put setup code here. This method is called before the invocation of each test method in the class.
//}
//
//- (void)tearDown {
//    // Put teardown code here. This method is called after the invocation of each test method in the class.
//    [super tearDown];
//}
//
//- (void)testExample {
//    // This is an example of a functional test case.
//    // Use XCTAssert and related functions to verify your tests produce the correct results.
//}
//
//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

- (void)testCalculatorWithEmptyString {
  
  Calculator *calculator = [[Calculator alloc] init];
  int result = [calculator addWithString:@""];
  XCTAssertEqual(result, 0, @"Should have matched");
  
}

- (void)testCalculatorWithSingleNumber {
  Calculator *calculator = [[Calculator alloc] init];
  int result = [calculator addWithString:@"1"];
  XCTAssertEqual(result, 1, @"Should have matched");
}

- (void)testCalculatorWithNumbers {
  Calculator *calculator = [[Calculator alloc] init];
  int result = [calculator addWithString:@"1,2,3,4,5"];
  XCTAssertEqual(result, 15, @"Should have matched");
}

- (void)testCalculatorWithNewLineAndNumbers {
  Calculator *calculator = [[Calculator alloc] init];
  int result = [calculator addWithString:@"1,2\n3"];
  XCTAssertEqual(result, 6, @"Should have matched");
}

- (void)testCalculaterWithSingleDelimeter {
  Calculator *calculator = [[Calculator alloc] init];
  int result = [calculator addWithString:@"//[::]\n1::2,3\n4::5"];
  XCTAssertEqual(result, 15, @"Should have matched");
}

- (void)testCalculaterWithMultipleDelimeters {
  Calculator *calculator = [[Calculator alloc] init];
  int result = [calculator addWithString:@"//[***][&][@]\n1***2&3&4***5@6@7,8\n9,10"];
  XCTAssertEqual(result, 55, @"Should have matched");
}

@end
