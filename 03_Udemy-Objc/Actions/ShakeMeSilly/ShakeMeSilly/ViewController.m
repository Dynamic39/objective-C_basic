//
//  ViewController.m
//  ShakeMeSilly
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  //타이머 실행
  timeInt = 10;
  scoreInt = 0;
  
  modelInt = 0;
  imageInt = 1;
  
  self.timeLabel.text = [NSString stringWithFormat:@"%i", timeInt];
  self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  
}


//start 게임을 진행하였을 때 액션 메서드
- (IBAction)startGame:(id)sender {
  
  if (timeInt == 10) {
    
    //NSTimer실행
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateCounter) userInfo:nil repeats:YES];
    modelInt = 1;
    
    //게임이 시작될때 재시작이 안되게 한다.
    self.startGameButton.enabled = NO;
    self.startGameButton.alpha = 0.5;
  }
  
  //세팅을 원래대로 돌려놓고 새로운 게임을 준비한다.
  if (timeInt == 0) {
    timeInt = 10;
    scoreInt = 0;
    
    self.timeLabel.text = [NSString stringWithFormat:@"%i", timeInt];
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
    self.imageView.image = [UIImage imageNamed:@"Maracas1"];
    
    [self.startGameButton setTitle:@"Start Game" forState:UIControlStateNormal];
  }

}

//counter를 세는 메서드를 정의한다.
-(void)updateCounter {
  
  timeInt -= 1;
  self.timeLabel.text = [NSString stringWithFormat:@"%i", timeInt];
  
  if (timeInt == 0) {
    //timeInt == 0 일시 타이머를 끈다.
    [timer invalidate];
    
    modelInt = 0;
    
    //게임이 종료되면, 스타트 버튼을 활성화 시켜준다.
    self.startGameButton.enabled = YES;
    self.startGameButton.alpha = 1.0;
    [self.startGameButton setTitle:@"Restart" forState:UIControlStateNormal];
    
  }
}

//모션 컨트롤러 진행
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
  
  if (event.subtype == UIEventSubtypeMotionShake) {
    
    if (modelInt == 1){
      
      //스코어를 하나씩 증가시킨다.
      scoreInt += 1;
      self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
      
      //imageInt가 1->4 를 순회하도록 만들어준다.
      
      imageInt += 1;
      
      if(imageInt == 5) {
        imageInt = 1;
      }
      
      self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"Maracas%i", imageInt]];
      
    }
  }
}


@end
