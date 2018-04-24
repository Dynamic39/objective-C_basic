//
//  EnablingViewController.h
//  HidingObjects
//
//  Created by Samuel K on 2018. 4. 13..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface EnablingViewController : ViewController

@property (weak, nonatomic) IBOutlet UIButton *enbutton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *enSegControl;
@property (weak, nonatomic) IBOutlet UISlider *enSlider;
@property (weak, nonatomic) IBOutlet UISwitch *enSwitch;
@property (weak, nonatomic) IBOutlet UILabel *enlabel;

- (IBAction)enable:(id)sender;
- (IBAction)disable:(id)sender;
- (IBAction)amIEnable:(id)sender;



@end
