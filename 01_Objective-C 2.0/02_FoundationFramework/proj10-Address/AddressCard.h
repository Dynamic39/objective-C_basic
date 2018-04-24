//
//  AddressCard.h
//  proj10-Address
//
//  Created by Samuel K on 2018. 4. 11..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressCard : NSObject
//프로퍼티 및 메서드 설정

@property (copy, nonatomic) NSString *name, *email;

-(void)setName:(NSString *)theName andEmail:(NSString *)theEmail;
//sort기능에 명시된 주소 카드에서 두 이름을 비교한다.
-(NSComparisonResult) compareNames:(id)element;
-(void)print;

-(NSString *)name;
-(NSString *)email;

//NSCopying 프로토콜을 위한 추가 메서드
-(void)assignName:(NSString *)theName andEmail:(NSString *)theEmail;




@end
