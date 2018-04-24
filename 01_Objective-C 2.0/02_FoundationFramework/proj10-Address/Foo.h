//
//  Foo.h
//  proj10-Address
//
//  Created by Samuel K on 2018. 4. 12..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Foo : NSObject <NSCoding>

@property (copy, nonatomic) NSString *strVal;
@property int intVal;
@property float floatVal;

@end
