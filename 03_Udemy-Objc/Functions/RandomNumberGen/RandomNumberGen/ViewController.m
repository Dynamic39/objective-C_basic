//
//  ViewController.m
//  RandomNumberGen
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


- (IBAction)random0100:(id)sender {
  
  //랜덤 변수 생성
  int randomNum = arc4random() % 101; // 0-100까지의 숫자 중 하나를 고릅니다.
  self.label1.text = [NSString stringWithFormat:@"%d", randomNum];
  
}

- (IBAction)random1020:(id)sender {
  
  int min = 10;
  int max = 21;
  int randomNum = arc4random_uniform(max - min) + min;
  self.label2.text = [NSString stringWithFormat:@"%d", randomNum];

}



@end
