//
//  MemoData.h
//  MemoryApp
//
//  Created by Samuel K on 2018. 4. 24..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MemoData : NSObject

@property (strong, nonatomic) id memoIdx;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *contents;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSDate *regDate;

@end
