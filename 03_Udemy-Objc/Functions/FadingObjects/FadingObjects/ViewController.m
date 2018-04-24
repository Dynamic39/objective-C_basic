//
//  ViewController.m
//  FadingObjects
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


- (IBAction)fadeIn:(id)sender {
  //fade in (animation effect)
  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationDuration:1.0];
  
  //알파 값 세팅
  [self.label setAlpha:1.0];
  [self.textView setAlpha:1.0];
  [self.segControl setAlpha:1.0];
  [self.switchControl setAlpha:1.0];
  
  [UIView commitAnimations];
  
  
}

- (IBAction)fadeOut:(id)sender {
  
  //fade out (animation effect)
  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationDuration:5.0];
  
  //알파 값 세팅
  [self.label setAlpha:0];
  [self.textView setAlpha:0];
  [self.segControl setAlpha:0];
  [self.switchControl setAlpha:0];
  
  [UIView commitAnimations];
  
}

- (IBAction)whatIsMyAlpha:(id)sender {
  
  self.label2.text = [NSString stringWithFormat:@"%1.2f", self.label.alpha];
  
}
@end
