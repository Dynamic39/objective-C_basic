//
//  ViewController.m
//  DigitalClock
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
  
  //세팅뷰의 기본은 히든임
  self.settingView.hidden = YES;
  
  //시작 할때 바로 시간이 보이게 해준다.
  [self updateTime];
  
  timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

-(void)updateTime
{
  //date formatter 적용
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:@"hh:mm:ss"];
  
  //시간 표시
  self.timeLabel.text = [formatter stringFromDate:[NSDate date]];

}


- (IBAction)clockSeg:(id)sender {
  
  [self chageColor:sender];
  
}

//세그먼트 숫자에 따라 시계 색이 바뀌게 한다.
-(void)chageColor: (UISegmentedControl *)segControl {
  
  switch (segControl.selectedSegmentIndex) {
    case 0:
      self.timeLabel.textColor = [UIColor whiteColor];
      break;
    case 1:
      self.timeLabel.textColor = [UIColor blackColor];
      break;
    case 2:
      self.timeLabel.textColor = [UIColor greenColor];
      break;
    case 3:
      self.timeLabel.textColor = [UIColor redColor];
      break;
    default:
      break;
  }
}




- (IBAction)backgroundSeg:(id)sender {
  
  [self changeBackgroundColor:sender];
  
}

-(void)changeBackgroundColor:(UISegmentedControl *)segControl
{
  switch (segControl.selectedSegmentIndex) {
    case 0:
      self.view.backgroundColor = [UIColor blackColor];
      break;
    case 1:
      self.view.backgroundColor = [UIColor whiteColor];
      break;
    case 2:
      self.view.backgroundColor = [UIColor blueColor];
      break;
    case 3:
      self.view.backgroundColor = [UIColor yellowColor];
      break;
    default:
      break;
  }
}

- (IBAction)settings:(id)sender {
  
  if (self.settingView.hidden == NO){
    
    self.settingView.hidden =  YES;
    self.settingButton.alpha = 0.25;
    [self.settingButton setTitle:@"Show Settings" forState:UIControlStateNormal];
    
    
  } else {
    
    self.settingView.hidden = NO;
    self.settingButton.alpha = 1.0;
    [self.settingButton setTitle:@"Hide  Settings" forState:UIControlStateNormal];
  }
    
  
}
@end
