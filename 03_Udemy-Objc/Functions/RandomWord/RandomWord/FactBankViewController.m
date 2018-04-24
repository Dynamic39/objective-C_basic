//
//  FracBankViewController.m
//  RandomWord
//
//  Created by Samuel K on 2018. 4. 13..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "FactBankViewController.h"

@interface FactBankViewController ()

@end

@implementation FactBankViewController

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

- (IBAction)randomFact:(id)sender {
  
  NSArray *facts = @[@"Fact1 : ",
                     @"Fact2 : ",
                     @"Fact3 : ",
                     @"Fact4 : ",
                     @"Fact5 : ",
                     ];
  
  int randomNum = arc4random() % facts.count;
  
  self.factLabel.text = facts[randomNum];
  
}
@end
