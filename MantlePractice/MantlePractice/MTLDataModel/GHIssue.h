//
//  GHIssue.h
//  MantlePractice
//
//  Created by Samuel K on 2018. 5. 29..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Mantle.h>
#import "GHUser.h"

typedef enum : NSUInteger {
    
    GHIssueStateOpen,
    GHIssueStateClosed
    
} GHIssueState;


@interface GHIssue : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSURL *URL;
@property (nonatomic, copy, readonly) NSURL *HTMLURL;
@property (nonatomic, copy, readonly) NSNumber *number;
@property (nonatomic, assign, readonly) GHIssueState state;
@property (nonatomic, strong, readonly) GHUser *assignee;
@property (nonatomic, copy, readonly) NSDate *updatedAt;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *body;

@property (nonatomic, copy, readonly) NSDate *retrievedAt;


@end
