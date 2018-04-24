//
//  ViewController.m
//  Actions
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
  // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


- (IBAction)action1:(id)sender {
  
  self.label.text = @"Action1";
  
}

- (IBAction)action2:(id)sender {
  
  self.label.text = @"Action2";
  
}

- (IBAction)action3:(id)sender {
  
  [self triggerAction];
  
}

-(void)triggerAction
{
  self.label.text = @"Action3";
}

@end
