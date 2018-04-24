//
//  sliderViewController.h
//  Actions
//
//  Created by Samuel K on 2018. 4. 13..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface sliderViewController : ViewController

@property (weak, nonatomic) IBOutlet UISlider *sliderAction;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;

- (IBAction)sliderSideControl:(id)sender;

@end
