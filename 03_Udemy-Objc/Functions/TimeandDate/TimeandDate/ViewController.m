//
//  ViewController.m
//  TimeandDate
//
//  Created by Samuel K on 2018. 4. 12..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
 
  [self timeRepeat];
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

//시간이 계속 반복되도록 설정
-(void)timeRepeat
{
  timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:NULL repeats:YES];
}

//타이머 업데이트
-(void)updateTimer
{
  
  //dateFormatter 시간설정
  //초기화
  NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
  //시간표기 설정
  [timeFormat setDateFormat:@"hh:mm:ss"];
  //시간 반환 - NSString
  self.timeLabel.text = [timeFormat stringFromDate:[NSDate date]];
  
  //dateFormatter 날짜
  //초기화
  NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
  //시간표기 설정
  [dateFormat setDateFormat:@"yyyy년 MM월 dd일"];
  //시간 반환 - NSString
  self.dateLabel.text = [dateFormat stringFromDate:[NSDate date]];
  
}


@end
