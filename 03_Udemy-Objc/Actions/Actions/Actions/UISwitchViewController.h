//
//  UISwitchViewController.h
//  Actions
//
//  Created by Samuel K on 2018. 4. 13..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface UISwitchViewController : ViewController

@property (weak, nonatomic) IBOutlet UISwitch *switchAction;
@property (weak, nonatomic) IBOutlet UILabel *switchLabel;
@property (weak, nonatomic) IBOutlet UIButton *switchButton;


- (IBAction)switchActionButton:(id)sender;



@end
