//
//  ViewController.m
//  TapMeFast
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
  
  //기본 시간 설정
  timeInt = 10;
  tapInt = 0;
  gameInt = 0;
  
  //label text 설정
  self.timeLabel.text = [NSString stringWithFormat:@"%i", timeInt];
  self.scoreLabel.text = [NSString stringWithFormat:@"%i", tapInt];
  
  
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  
}


- (IBAction)startGame:(id)sender {
  
  //게임 시작 구현
  if (timeInt == 10){
    
    [self startCounter];
    //NSTimer 기능 구현
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startCounter) userInfo:nil repeats:YES];
    
    self.startButton.enabled = NO;
    self.startButton.alpha = 0.5;
    
  }
  
  if (gameInt == 1) {
    
    tapInt += 1;
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", tapInt];
    
  } else {
    
    timeInt = 10;
    tapInt = 0;
    self.timeLabel.text = [NSString stringWithFormat:@"%i", timeInt];
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", tapInt];
    
    [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
    
  }

}

//카운터 메서드 만들기
-(void)startCounter{
  
  timeInt += -1;
  self.timeLabel.text = [NSString stringWithFormat:@"%i", timeInt];
  gameInt = 1;
  
  //버튼의 값을 바꿔준다.
  [self.startButton setTitle:@"Tap!" forState:UIControlStateNormal];
  
  self.startButton.enabled = YES;
  self.startButton.alpha = 1.0;
  
  //시간이 0으로 되었을 때, 타이머를 멈춘다.
  if (timeInt == 0) {
    [timer invalidate];
    
    self.startButton.enabled = NO;
    self.startButton.alpha = 0.5;
    
    //재시작을 할 수 있도록 해줌
    [self.startButton setTitle:@"Restart" forState:UIControlStateNormal];
    //NSTimer를 설정하여 준다.
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(restart) userInfo:nil repeats:NO];
 
  }
}

//재시작 메서드를 구현하여 준다.
-(void)restart{
  
  self.startButton.enabled = YES;
  self.startButton.alpha = 1.0;
  
  gameInt = 0;
  
  
  
}










@end
