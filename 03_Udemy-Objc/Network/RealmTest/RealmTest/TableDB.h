//
//  RealmData.h
//  RealmTest
//
//  Created by Samuel K on 2018. 5. 17..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm.h>


RLM_ARRAY_TYPE(TableDB)
RLM_ARRAY_TYPE(Group)

@interface TableDB : RLMObject

@property NSString *titleName;
@property NSDate *date;

@end

@interface Group : RLMObject

@property (nonatomic, strong) NSString *name;
@property RLMArray <TableDB *><TableDB> *entries;
@end

@interface GroupParent : RLMObject
@property RLMArray <Group *><Group> *groups;
@end
