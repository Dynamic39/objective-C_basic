//
//  AvgOperation.h
//  DispatchSample
//
//  Created by Samuel K on 2018. 5. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AvgOperation : NSOperation

@property (strong, nonatomic) NSArray *list;
@property double result;

-(instancetype)initWithData:(NSArray *)dataList;

@end
