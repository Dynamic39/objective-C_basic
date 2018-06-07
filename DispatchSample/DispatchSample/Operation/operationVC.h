//
//  operationVC.h
//  DispatchSample
//
//  Created by Samuel K on 2018. 5. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SumOperation.h"
#import "AvgOperation.h"
#import "StringOperation.h"

@interface operationVC : UIViewController

@property (strong, nonatomic) NSOperationQueue *opQueue;
@property (strong, nonatomic) NSMutableArray *dataList;

- (IBAction)performConcurrentMode:(id)sender;

- (IBAction)cancelAllOpeations:(id)sender;
- (IBAction)performSerialMode:(id)sender;

@end
