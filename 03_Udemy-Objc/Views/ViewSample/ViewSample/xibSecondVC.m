//
//  xibSecondVC.m
//  ViewSample
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "xibSecondVC.h"

@interface xibSecondVC ()

@end

@implementation xibSecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)goHome:(id)sender {
  
  [self dismissViewControllerAnimated:TRUE completion:nil];
  
}
@end
