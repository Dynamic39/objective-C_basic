//
//  SecondViewController.m
//  DevslopesTutorials
//
//  Created by Samuel K on 2018. 5. 4..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveData:(id)sender {
  
  //Data를 넣어준다.
  [self.delegate toPassData:self.inpuTF.text];
  
}
@end
