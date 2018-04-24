//
//  ViewController.m
//  VisualSample
//
//  Created by Samuel K on 2018. 4. 17..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.imageView1.image = [UIImage imageNamed:@"Dog"];
  
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

//Button이 클릭되었을 때,
- (IBAction)showMeTheImage:(id)sender {
  
  self.imageView2.image = [UIImage imageNamed:@"Dog"];
  
  
  
}
@end
