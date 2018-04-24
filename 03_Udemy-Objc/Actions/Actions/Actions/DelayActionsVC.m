//
//  DelayActionsVC.m
//  Actions
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "DelayActionsVC.h"

@interface DelayActionsVC ()

@end

@implementation DelayActionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



- (IBAction)delayAction:(id)sender {
  
  //딜레이를 진행하는 메서드
  [self performSelector:@selector(delay) withObject:nil afterDelay:5.0];
  
}

//지연 액션을 실행하기 위한 추가 메서드를 구현한다.
-(void)delay {
  
  self.delayActionLabel.text = @"Hello";
  
  
}

@end
