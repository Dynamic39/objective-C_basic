//
//  xibVC.m
//  ViewSample
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "xibVC.h"
//xib 파일을 열기 위해선 해당 헤더파일을 가지고 와야 한다.
#import "xibSecondVC.h"

@interface xibVC ()

@end

@implementation xibVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)switchView:(id)sender {
  
  //xib파일 오픈
  xibSecondVC *second = [[xibSecondVC alloc] initWithNibName:nil bundle:nil];
  second.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
  [self presentViewController:second animated:YES completion:nil];
  
}
@end
