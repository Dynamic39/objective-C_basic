//
//  EnablingViewController.m
//  HidingObjects
//
//  Created by Samuel K on 2018. 4. 13..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "EnablingViewController.h"

@interface EnablingViewController ()

@end

@implementation EnablingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


- (IBAction)enable:(id)sender {
  
  self.enbutton.enabled = YES;
  self.enSegControl.enabled = YES;
  self.enSlider.enabled = YES;
  self.enSwitch.enabled = YES;
  
}

- (IBAction)disable:(id)sender {
  
  self.enbutton.enabled = NO;
  self.enSegControl.enabled = NO;
  self.enSlider.enabled = NO;
  self.enSwitch.enabled = NO;
  
}

- (IBAction)amIEnable:(id)sender {
  
  if (self.enbutton.enabled == YES){
    self.enlabel.text = @"i am Enabled";
  } else {
    self.enlabel.text = @"i am disabled";
  }
  
}
@end
