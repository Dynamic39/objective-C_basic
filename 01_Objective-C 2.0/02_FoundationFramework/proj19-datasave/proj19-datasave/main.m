//
//  main.m
//  proj19-datasave
//
//  Created by Samuel K on 2018. 4. 12..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    //딕셔너리 생성 및 plist저장
//    NSDictionary *glossary = @{
//                               @"abstract class":
//                                 @"A class defined so other classes can inherit from it.",
//                               @"adopt":
//                                 @"To implement all the methods defined in a protocol",
//                               @"archiving":
//                                 @"Storing an object for later usse."
//                               };
//    if ([glossary writeToFile:@"glossary" atomically:YES] == NO)
//      NSLog(@"Save to file failed");
//    NSLog(@"Save success!");
    
    //내용 읽어오기
//    NSDictionary *glossary;
//
//    glossary = [NSDictionary dictionaryWithContentsOfFile:@"glossary"];
//
//    for (NSString *key in glossary)
//      NSLog(@"%@: %@", key, glossary[key]);
    
    //NSKeyedArchiver 로 저장하기
//        NSDictionary *glossary = @{
//                                   @"abstract class":
//                                     @"A class defined so other classes can inherit from it.",
//                                   @"adopt":
//                                     @"To implement all the methods defined in a protocol",
//                                   @"archiving":
//                                     @"Storing an object for later usse."
//                                   };
//    [NSKeyedArchiver archiveRootObject:glossary toFile:@"glossary.archive"];
    
    ////NSKeyedArchiver로 불러오기
    NSDictionary *glossary;
    
    glossary = [NSKeyedUnarchiver unarchiveObjectWithFile:@"glossary.archive"];
    
    for (NSString *key in glossary)
      NSLog(@"%@: %@", key, [glossary objectForKey:key]);
    
  }
  return 0;
}
