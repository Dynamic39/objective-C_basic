//
//  UISwitchViewController.m
//  Actions
//
//  Created by Samuel K on 2018. 4. 13..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "UISwitchViewController.h"

@interface UISwitchViewController ()

@end

@implementation UISwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


- (IBAction)switchActionButton:(id)sender {
  
  if (self.switchAction.on) {
    
    self.label.text = @"On";
    self.switchButton.enabled = YES;
    
  } else {
    
    self.label.text = @"OFF";
    self.switchButton.enabled = NO;
    
  }
  
}




@end
