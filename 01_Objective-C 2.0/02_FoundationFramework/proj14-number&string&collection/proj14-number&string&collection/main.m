//
//  main.m
//  proj14-number&string&collection
//
//  Created by Samuel K on 2018. 4. 11..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
//    NSNumber *myNumber, *floatNumber, *intNumber;
//    NSInteger myInt;
//
//    //integer 값
//    intNumber = [NSNumber numberWithInteger:100];
//    myInt = [intNumber integerValue];
//    NSLog(@"%li", (long)myInt);
//
//    //long값
//    myNumber = [NSNumber numberWithLong:0xabcdf];
//    NSLog(@"%lx", [myNumber longValue]);
//
//    //char값
//    myNumber = [NSNumber numberWithChar:'X'];
//    NSLog(@"%c", [myNumber charValue]);
//
//    //float value
//    floatNumber = [NSNumber numberWithFloat:100.00];
//    NSLog(@"%g", [floatNumber floatValue]);
//
//    //double value
//    myNumber = [NSNumber numberWithDouble:12345e+15];
//    NSLog(@"%g", [myNumber doubleValue]);
//
//    //incorrect access
//    NSLog(@"%li", (long)[myNumber integerValue]);
//
//    //compare with two number value
//    if ([intNumber isEqualToNumber:floatNumber] == YES)
//      NSLog(@"Numbers are Equal");
//    else
//      NSLog(@"Numbers are not Equal");
//
//    //두 숫자의 크기 비교
//    if ([intNumber compare:myNumber] == NSOrderedAscending)
//      NSLog(@"First number is less than second");
//
    
    //리터럴 숫자 객체
    
//    NSNumber *myNumber, *floatNumber, *intNumber;
//    NSInteger myInt;
//
//    //Interger 값
//    intNumber = @100;
//    myInt = [intNumber integerValue];
//    NSLog(@"%li", (long)myInt);
//
//    //long value 값
//    myNumber = @0xabcdefL;
//    NSLog(@"%lx", [myNumber longValue]);
//
//    myNumber = @'X';
//    NSLog(@"%c", [myNumber charValue]);
//
//    //float value 값
//    floatNumber = @100.0f;
//    NSLog(@"%g", [floatNumber floatValue]);
    
    //NSString 객체 생성
//    NSString *str = @"Programmin is fun";
//    NSLog(@"%@", str);
    
    //기본 스트링 작업
    
//    NSString *str1 = @"This is string A";
//    NSString *str2 = @"This is string B";
//    NSString *res;
//
//    NSComparisonResult compareResult;
//
//    //문자 개수 세기
//    NSLog(@"Length of str1: %lu", [str1 length]);
//
//    //스트링 복사하기
//    res = [NSString stringWithString:str1];
//    NSLog(@"copy: %@", res);
//
//    //스트링을 다른 스트링 뒤에 붙여 복사하기
//    str2 = [str1 stringByAppendingString:str2];
//    NSLog(@"Concatentation: %@",str2);
//
//    //두개의 스트링이 같은지 비교
//    if ([str1 isEqualToString:res] == YES)
//      NSLog(@"str1 == res");
//    else
//      NSLog(@"str1 != res");
//
//    //두개의 스트링 크기 비교
//    compareResult = [str1 compare:str2];
//
//    if (compareResult == NSOrderedAscending)
//      NSLog(@"str1 < str2");
//    else if (compareResult == NSOrderedSame)
//      NSLog(@"str1 == str2");
//    else
//      NSLog(@"str1 > str2");
//
//    //대문자로 변환
//    res = [str1 uppercaseString];
//    NSLog(@"Uppercase conversion: %s", [res UTF8String]);
//
//    //소문자로 변환
//    res = [str1 lowercaseString];
//    NSLog(@"Lowercase conversion: %@", res);
//
//    NSLog(@"Original string: %@", res);
    
    //기본 스트링 작업
    
//    NSString *str1 = @"This is string A";
//    NSString *str2 = @"This is string B";
//    NSString *res;
//    NSRange subRange;
//
//    //스트링에서 처음부터 세번째까지 문자 추출하기
//    res = [str1 substringToIndex:3];
//    NSLog(@"First 3 chars of str1: %@", res);
//
//    //인덱스 5부터 끝까지 문자 추출하기
//    res = [str1 substringFromIndex:5];
//    NSLog(@"Chars from index5 of str1: %@", res);
//
//    //인덱스 8부터 13까지 문자(6개) 추출하기
//    res = [[str1 substringFromIndex:8] substringToIndex:6];
//    NSLog(@"Chars from index 8 through 13: %@", res);
//
//    //상기 동일한 작업을 쉽게 하는 방법
//    res = [str1 substringWithRange:NSMakeRange(8, 6)];
//    NSLog(@"Chars from index 8 through 13: %@", res);
//
//    //스트링 안에서 스트링 찾기
//    subRange = [str1 rangeOfString:@"string A"];
//    NSLog(@"String is at index %lu, length is %lu", subRange.location, subRange.length);
//
//    subRange = [str1 rangeOfString:@"string B"];
//
//    if (subRange.location == NSNotFound)
//      NSLog(@"String not found");
//    else
//      NSLog(@"String is at index %lu, length is %lu", subRange.location, subRange.length);
    
    //기본 스트링 작업 - 수정 가능한 스트링
    
//    NSString *str1 = @"This is string A";
//    NSString *search, *replace;
//    NSMutableString *mstr;
//    NSRange substr;
//
//    //수정 불가능한 스트링으로부터 수정 가능한 스트링 만들기
//    mstr = [NSMutableString stringWithString:str1];
//    NSLog(@"%@", mstr);
//
//    //문자 집어넣기
//    [mstr insertString:@" mutable" atIndex:7];
//    NSLog(@"%@", mstr);
//
//    //맨뒤에 넣는 경우 병합하기
//    [mstr insertString:@" and string B" atIndex:[mstr length]];
//    NSLog(@"%@", mstr);
//
//    //appendString 직접사용
//    [mstr appendString:@" and string C"];
//    NSLog(@"%@", mstr);
//
//    //범위로 주어진 서브스트링 지우기
//    [mstr deleteCharactersInRange:NSMakeRange(16, 13)];
//    NSLog(@"%@", mstr);
//
//    //스트링 범위 찾아 삭제하기
//    substr = [mstr rangeOfString:@"string B and "];
//
//    if (substr.location != NSNotFound)
//    {
//      [mstr deleteCharactersInRange:substr];
//    }
//
//    //수정가능한 스트링 직접 설정하기
//    [mstr setString:@"This is string A"];
//    NSLog(@"%@", mstr);
//
//    //특정 범위를 다른 스트링으로 대치하기
//    [mstr replaceCharactersInRange:NSMakeRange(8, 8) withString:@"a mutable string"];
//    NSLog(@"%@", mstr);
//
//    //검색과 대치
//    search = @"This is";
//    replace = @"An example of";
//
//    substr = [mstr rangeOfString:search];
//
//    if (substr.location != NSNotFound)
//    {
//      [mstr replaceCharactersInRange:substr withString:replace];
//      NSLog(@"%@", mstr);
//    }
//
//    //모두 찾아 대치하기
//    search = @"a";
//    replace = @"X";
//
//    substr = [mstr rangeOfString:search];
//
//    while (substr.location != NSNotFound) {
//      [mstr replaceCharactersInRange:substr withString:replace];
//      substr = [mstr rangeOfString:search];
//    }
//
//    NSLog(@"%@", mstr);
    
    //기본 배열 정리
    //배열 설정
//    int i;
//    NSArray *monthNames = [NSArray arrayWithObjects:@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December", nil];
//
//    NSLog(@"Month  Name");
//    NSLog(@"====   ====");
//
//    for (i = 0; i < 12; ++i)
//      NSLog(@" %2i    %@", i + 1, monthNames[i]);
    
    NSMutableArray *numbers = [NSMutableArray array];
    int i;
    
    //숫자 0-9로 배열을 생성한다.
    for (i = 0; i < 10; ++i)
      numbers[i] = @(i);
    
    //배열의 항목에 순차적으로 접근하여 값을 표시한다.
    
    for (i = 0; i <10; ++i)
      NSLog(@"%@", numbers[i]);
    
    
    //NSLog가 하나의 %@ 포맷으로 표시한다.
    NSLog(@"===== using a single NSLog");
    NSLog(@"%@", numbers);
    
    
    
    
  }
  return 0;
}
