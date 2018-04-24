//
//  AddressBook.h
//  proj10-Address
//
//  Created by Samuel K on 2018. 4. 11..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressCard.h"

@interface AddressBook : NSObject <NSCoding, NSCopying>

//이름 및 담을 배열 설정
@property (nonatomic, copy) NSString *bookName;
@property (nonatomic, strong) NSMutableArray *book;

-(id)initWithName:(NSString *)name;
-(void)addCard:(AddressCard *)theCard;
-(int)entries;
-(void)list;

//주소록에서 사람 찾기
-(AddressCard *)lookUp:(NSString *)theName;
//주소록에서 카드 지우기
-(void)removeCard:(AddressCard *)theCard;
//검색하는 것과 동일 여부 확인
//-(BOOL)isEqual:(AddressCard *)theCard;
//sort 정렬
-(void)sort;


@end
