//
//  MainListVC.h
//  MemoryApp
//
//  Created by Samuel K on 2018. 4. 24..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemoData.h"
#import "MemoFormVC.h"
#import "MemoCell.h"
#import "MemoReadVC.h"
#import "SWRevealViewController.h"


@interface MainListVC : UITableViewController <MemoFormDelegate>

@property (nonatomic, weak) NSString *datapass;

- (IBAction)testSample:(id)sender;


@end
