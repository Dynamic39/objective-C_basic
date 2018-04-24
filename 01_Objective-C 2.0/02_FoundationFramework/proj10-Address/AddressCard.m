//
//  AddressCard.m
//  proj10-Address
//
//  Created by Samuel K on 2018. 4. 11..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "AddressCard.h"

@implementation AddressCard

@synthesize name, email;

//데이터를 인코딩 하기 위한 메서드 구현

- (void)encodeWithCoder:(NSCoder *)coder
{
  [coder encodeObject:name forKey:@"AddressCardName"];
  [coder encodeObject:email forKey:@"AddressCardEmail"];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
  
  name = [coder decodeObjectForKey:@"AddressCardName"];
  email = [coder decodeObjectForKey:@"AddressCardName"];
  
  return self;
}



- (void)setName:(NSString *)theName andEmail:(NSString *)theEmail
{
  if (self.name != theName && self.email != theEmail)
  self.name = theName;
  self.email = theEmail;
}

- (NSString *)name
{
  return name;
}

- (NSString *)email
{
  return email;
}

- (void)print
{
  NSLog(@"=====================================");
  NSLog(@"|                                   |");
  NSLog(@"|  %-31s  |", [name UTF8String]);
  NSLog(@"|  %-31s  |", [email UTF8String]);
  NSLog(@"|                                   |");
  NSLog(@"|                                   |");
  NSLog(@"|                                   |");
  NSLog(@"|       0                   0       |");
  NSLog(@"=====================================");
}

- (NSComparisonResult)compareNames:(id)element
{
  return [name compare:[element name]];
}

@end
