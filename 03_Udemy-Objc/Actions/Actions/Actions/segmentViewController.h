//
//  segmentViewController.h
//  Actions
//
//  Created by Samuel K on 2018. 4. 13..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface segmentViewController : ViewController

@property (weak, nonatomic) IBOutlet UILabel *segLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentSample;

- (IBAction)segmentAction:(id)sender;

@end
