//
//  Honda.h
//  DevslopeSample
//
//  Created by Samuel K on 2018. 5. 4..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Honda : NSObject

@property (nonatomic, strong) NSString *model;
@property (nonatomic, strong) NSNumber *miles;

-(void)increaseMilesToOdemeter;
-(void)drive;

@end
