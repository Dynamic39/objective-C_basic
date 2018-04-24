//
//  main.m
//  proj10-Address
//
//  Created by Samuel K on 2018. 4. 11..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressCard.h"
#import "AddressBook.h"
#import "Foo.h"

int main(int argc, const char * argv[]) {
  
  @autoreleasepool {
    
    NSString *looupUser;
    
    NSString *aName = @"Julia Kochan";
    NSString *aEmail = @"jewls337@axlc.com";
    NSString *bName = @"Tony Iannino";
    NSString *bEmail = @"tony.iannino@techfitness.com";
    NSString *cName = @"Stephen Kochan";
    NSString *cEmail = @"steve@classroomM.com";
    NSString *dName = @"Jamie Baker";
    NSString *dEmail = @"jbaker@classroomM.com";
    
    AddressCard *card1 = [[AddressCard alloc] init];
    AddressCard *card2 = [[AddressCard alloc] init];
    AddressCard *card3 = [[AddressCard alloc] init];
    AddressCard *card4 = [[AddressCard alloc] init];
    
    //주소록 카드를 만든다
    AddressBook *myBook = [[AddressBook alloc] initWithName:@"Linda's Address Book"];
    
    NSLog(@"Entries in address book after cration: %i", [myBook entries]);
    
    
    [card1 setName:aName andEmail:aEmail];
    [card2 setName:bName andEmail:bEmail];
    [card3 setName:cName andEmail:cEmail];
    [card4 setName:dName andEmail:dEmail];
    
    [myBook addCard:card1];
    [myBook addCard:card2];
    [myBook addCard:card3];
    [myBook addCard:card4];
    
    NSLog(@"Entries in address book after adding cards: %i", [myBook entries]);
    
    //주소록의 모든 항목을 나열한다.
    //[myBook list];
    
//    AddressCard *myCard;
//
//    NSLog(@"Stephen Kochan");
//    myCard = [myBook lookUp:@"Stephen Kochan"];
//
//    if (myCard != nil)
//      [myCard print];
//    else
//      NSLog(@"Not found");
//
//    [myBook removeCard:myCard];
//    [myBook list];
    
    //정렬
    [myBook sort];
    
    if ([NSKeyedArchiver archiveRootObject:myBook toFile:@"addrbook.arch"] == NO)
      NSLog(@"archiving failed");
    
    
    myBook = [NSKeyedUnarchiver unarchiveObjectWithFile:@"addrbook.arch"];
    NSLog(@"Successful loaded");
    [myBook list];
    
    Foo *myFoo1 = [[Foo alloc] init];
    Foo *myFoo2;
    
    [myFoo1 setStrVal:@"his is the string"];
    [myFoo1 setIntVal:12345];
    [myFoo1 setFloatVal:98.6];
    
    [NSKeyedArchiver archiveRootObject:myFoo1 toFile:@"oo.arch"];
    myFoo2 = [NSKeyedUnarchiver unarchiveObjectWithFile:@"oo.arch"];
    
    NSLog(@"%@\n%i\n%g", [myFoo2 strVal], [myFoo2 intVal], [myFoo2 floatVal]);
    
    
    
    
    
  }
  return 0;
}
