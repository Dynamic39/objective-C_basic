//
//  AddressBook.m
//  proj10-Address
//
//  Created by Samuel K on 2018. 4. 11..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "AddressBook.h"

@implementation AddressBook

@synthesize bookName, book;

//구현 파일에 포함할 메서드를 정의
- (void)encodeWithCoder:(NSCoder *)coder
{
  [coder encodeObject:bookName forKey:@"AddressBookBookName"];
  [coder encodeObject:book forKey:@"AddressBookBook"];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
  bookName = [coder decodeObjectForKey:@"AddressBookBookName"];
  book = [coder decodeObjectForKey:@"AddressBookBook"];
  return self;
}

//어드레스북의 이름을 설정하고 빈 주소록을 생성한다.

- (id)initWithName:(NSString *)name
{
  //초기화를 시킨다
  self = [super init];
  
  //초기화를 시키면 필요한 정보들에 대해서 추가로 초기화 시킨다.
  if (self)
  {
    //북 이름을 지정해 줘야 하기 때문에 인자를 받아 복사 한다.
    bookName = [NSString stringWithString:name];
    book = [NSMutableArray array];
  }
  //초기화 된 부분을 반환한다.
  return self;
}

-(id)init
{
  return [self initWithName:@"NoName"];
}

- (void)addCard:(AddressCard *)theCard
{
  [book addObject:theCard];
}

- (int)entries
{
  return [book count];
}

- (void)list
{
  NSLog(@"========== Contents of %@ ==========", bookName);
  
  for (AddressCard *theCard in book)
    NSLog(@"%-20s    %-32s", [theCard.name UTF8String], [theCard.email UTF8String]);
  NSLog(@"======================================================");
}

- (AddressCard *)lookUp:(NSString *)theName
{
  for (AddressCard *nextCard in book)
    if ([nextCard.name caseInsensitiveCompare:theName] == NSOrderedSame)
      return nextCard;
  
  return nil;
}

- (void)removeCard:(AddressCard *)theCard
{
  [book removeObjectIdenticalTo:theCard];
}

//sort 적용
- (void)sort
{
  [book sortUsingSelector:@selector(compareNames:)];
}



@end
