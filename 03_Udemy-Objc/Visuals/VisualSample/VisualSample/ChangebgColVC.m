//
//  ChangebgColVC.m
//  VisualSample
//
//  Created by Samuel K on 2018. 4. 17..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ChangebgColVC.h"

@interface ChangebgColVC ()

@end

@implementation ChangebgColVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)red:(id)sender {
  
  self.view.backgroundColor = [UIColor redColor];
  
}

- (IBAction)blue:(id)sender {
  
  self.view.backgroundColor = [UIColor blueColor];

}

- (IBAction)green:(id)sender {
  
  self.view.backgroundColor = [UIColor greenColor];
  
}

- (IBAction)yellow:(id)sender {
  
  self.view.backgroundColor = [UIColor yellowColor];
  
}

- (IBAction)black:(id)sender {
  
  self.view.backgroundColor = [UIColor blackColor];
  
}

- (IBAction)white:(id)sender {
  
  self.view.backgroundColor = [UIColor whiteColor];
  
}

- (IBAction)custom:(id)sender {
  
  self.view.backgroundColor = [UIColor colorWithRed: 0/255.0 green:25/255.0 blue:134/255.0 alpha:1.0];
  
}


@end
