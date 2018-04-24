//
//  sliderViewController.m
//  Actions
//
//  Created by Samuel K on 2018. 4. 13..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "sliderViewController.h"

@interface sliderViewController ()

@end

@implementation sliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)sliderSideControl:(id)sender {
  
  [self.sliderLabel setFont:[UIFont fontWithName:@"verdana" size:self.sliderAction.value]];
  
}






@end
