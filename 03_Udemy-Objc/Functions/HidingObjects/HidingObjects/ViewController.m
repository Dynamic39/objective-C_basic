//
//  ViewController.m
//  HidingObjects
//
//  Created by Samuel K on 2018. 4. 13..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  
}


- (IBAction)hide:(id)sender {
  
  self.label.hidden = YES;
  self.segControl.hidden = YES;
  self.slider.hidden = YES;
  
}

- (IBAction)reveal:(id)sender {
  
  self.label.hidden = NO;
  self.segControl.hidden = NO;
  self.slider.hidden = NO;
  
}

- (IBAction)amiHidden:(id)sender {
  
  //hidden 여부 확인
  if (self.label.hidden == YES) {
    self.label2.text = @"the object is hidden";
  } else {
    self.label2.text = @"the object is not hidden";
  }
  
  
}

@end
