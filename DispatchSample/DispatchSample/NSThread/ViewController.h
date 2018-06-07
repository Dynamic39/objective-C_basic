//
//  ViewController.h
//  DispatchSample
//
//  Created by Samuel K on 2018. 5. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BackgroundTask.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *runnningTaskCountLabel;
@property NSInteger runningTaskCount;
@property BOOL stop;



- (IBAction)startTask:(id)sender;
- (IBAction)stopTask:(id)sender;

@end

