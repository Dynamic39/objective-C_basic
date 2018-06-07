//
//  MemoRealm.h
//  MemoryApp
//
//  Created by Samuel K on 2018. 5. 29..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm.h>

@interface MEMO_TB : RLMObject

@property NSString *TITLE_TXT;
@property NSString *CONTENTS;
@property NSData *CONVERTED_IMAGE;
@property NSDate *REG_DATE;

@end

