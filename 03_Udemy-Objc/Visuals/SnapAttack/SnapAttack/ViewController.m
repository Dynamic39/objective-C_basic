//
//  ViewController.m
//  SnapAttack
//
//  Created by Samuel K on 2018. 4. 17..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
  
  NSTimer *timer;
  NSTimer *imageTimer;
  
  int timeInt;
  int scoreInt;
  int gameInt;
  
}

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  //기본 값 설정
  timeInt = 20;
  scoreInt = 0;
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  
}


- (IBAction)startGame:(id)sender {
  
  //timeInt가 기본값일 때 실행되는 메서드
  if (timeInt == 20) {
    
    //타이머 실행
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    //이미지 타이머 실행
    imageTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(cardUpdate) userInfo:nil repeats:YES];
    
    //button에 대한 설정을 해준다.
    self.startButton.enabled = NO;
    self.startButton.alpha = 0.5;
    [self.startButton setTitle:@"Sanp" forState:UIControlStateNormal];
    
  }
  
//  if (timeInt == 0) {
    
//    timeInt = 20;
//    scoreInt = 0;
//    self.timeLabel.text = [NSString stringWithFormat:@"Time : %i", timeInt];
//    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %i", scoreInt];
//
//    self.imageView1.image = [UIImage imageNamed:@"blue_cover"];
//    self.imageView2.image = [UIImage imageNamed:@"blue_cover"];
//    [self.startButton setTitle:@"START" forState:UIControlStateNormal];
    
//  }
  
  //game에 대한 rule을 정하는 조건문 생성
  if (gameInt == 1) {
    //각각의 사진이 일치할때 마다, Score를 올려준다
    if ([self.imageView1.image isEqual:self.imageView2.image]) {
      scoreInt += 1;
      self.scoreLabel.text = [NSString stringWithFormat:@"Score : %i", scoreInt];
    } else {
      
      scoreInt -= 1;
      self.scoreLabel.text = [NSString stringWithFormat:@"Score : %i", scoreInt];
      
    }
  }
  
}

//Timer설정
-(void)updateTimer {
  
  timeInt -= 1;
  self.timeLabel.text = [NSString stringWithFormat:@"Time : %i", timeInt];
  
  self.startButton.enabled = YES;
  self.startButton.alpha = 1.0;
  
  gameInt = 1;
  
  if (timeInt == 0) {
    //시간이 경과되면 작업을 중지한다.
    [timer invalidate];
    [imageTimer invalidate];
    
    gameInt = 0;
    
    [self.startButton setTitle:@"ReStart" forState:UIControlStateNormal];
    
    self.startButton.enabled = NO;
    self.startButton.alpha = 0.5;
    
    //delay를 주는 메세드를 통하여 다음 시작하지 전에 확인 할 수 있게 한다.
    [self performSelector:@selector(restartTrigger) withObject:nil afterDelay:4.0];
    
  }
}

//재시작과 관련된 메서드
-(void)restartTrigger {
  
  self.startButton.enabled = YES;
  self.startButton.alpha = 1.0;
  
  gameInt = 0;
  
//      timeInt = 20;
//      scoreInt = 0;
//      self.timeLabel.text = [NSString stringWithFormat:@"Time : %i", timeInt];
//      self.scoreLabel.text = [NSString stringWithFormat:@"Score : %i", scoreInt];
//  
//      self.imageView1.image = [UIImage imageNamed:@"blue_cover"];
//      self.imageView2.image = [UIImage imageNamed:@"blue_cover"];
//      [self.startButton setTitle:@"START" forState:UIControlStateNormal];
  
}


//card 를 전환해주는 메서드를 생성한다.
-(void)cardUpdate {
  
  //random으로 카드 값을 변경하여 준다.
  //배열 설정
  NSArray *cardList = @[@"ace_of_hearts.png",
                        @"2_of_hearts.png",
                        @"3_of_hearts.png",
                        @"4_of_hearts.png",
                        @"5_of_hearts.png",
                        @"6_of_hearts.png",
                        @"7_of_hearts.png",
                        @"8_of_hearts.png",
                        @"9_of_hearts.png",
                        @"10_of_hearts.png"];
  
  //random 번호를 생성하고, 이미지에 넣어준다.
  int randomCard1 = arc4random() % cardList.count;
  self.imageView1.image = [UIImage imageNamed:cardList[randomCard1]];
  
  int randomCard2 = arc4random() % cardList.count;
  self.imageView2.image = [UIImage imageNamed:cardList[randomCard2]];
  
  //
  
  
  
  
  
}



@end
