//
//  main.m
//  proj18-copy
//
//  Created by Samuel K on 2018. 4. 11..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    //기본 참조 및 복사 후, 삭제 구현 프로그램
//    NSMutableArray *dataArray = [NSMutableArray arrayWithObjects:@"one", @"two", @"three", @"four", nil];
//    NSMutableArray *dataArray2;
//
//    //간단한 대입
//    dataArray2 = dataArray;
//    [dataArray2 removeObjectAtIndex:0];
//
//    NSLog(@"dataArray: ");
//    for (NSString *elem in dataArray)
//      NSLog(@"   %@", elem);
//
//    NSLog(@"dataArray2: ");
//    for (NSString *elem in dataArray2)
//      NSLog(@"   %@", elem);
//
//    //복사하고 복사본의 첫 원소를 삭제한다.
//    dataArray2 = [dataArray mutableCopy];
//    [dataArray2 removeObjectAtIndex:0];
//
//    NSLog(@"dataArray: ");
//    for (NSString *elem in dataArray)
//      NSLog(@"   %@", elem);
//
//    NSLog(@"dataArray2: ");
//    for (NSString *elem in dataArray2)
//      NSLog(@"   %@", elem);
    
    
    //수정불가능한 스트링으로 채워넣은 배열을 수정
    NSMutableArray *dataArray = [NSMutableArray arrayWithObjects:
                                 [NSMutableString stringWithString:@"one"],
                                 [NSMutableString stringWithString:@"two"],
                                 [NSMutableString stringWithString:@"three"]
                                 , nil];
    
    NSMutableArray *dataArray2;
    NSMutableString *mStr;
    
    NSLog(@"dataArray:  ");
    for (NSString *elem in dataArray)
      NSLog(@"   %@", elem);
    
    //사본을 만들고 스트링 중 하나를 바꾼다.
    dataArray2 = [dataArray mutableCopy];
    
    mStr = [dataArray objectAtIndex:0];
    [mStr appendString:@"ONE"];
    
    NSLog(@"dataArray:  ");
    for (NSString *elem in dataArray)
      NSLog(@"   %@", elem);
    
    NSLog(@"dataArray2:  ");
    for (NSString *elem in dataArray2)
      NSLog(@"    %@", elem);
      
    
    
  }
  return 0;
}
