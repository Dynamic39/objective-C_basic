//
//  ViewController.m
//  SimonSays
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
  
  NSTimer *timer;
  NSTimer *simonTimer;
  
  int timeInt;
  int scoreInt;
  int modeInt;
}

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  //saylabel의 형태를 둥글게 만들어줌
  self.saysLabel.layer.cornerRadius = 20;
  self.saysLabel.clipsToBounds = YES;
  
  //각각의 제스쳐를 바꿔줌
  self.leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
  self.rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
  self.upSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
  self.downSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
  
  self.leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
  self.rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
  self.upSwipe.direction = UISwipeGestureRecognizerDirectionUp;
  self.downSwipe.direction = UISwipeGestureRecognizerDirectionDown;
  
  [self.view addGestureRecognizer:self.leftSwipe];
  [self.view addGestureRecognizer:self.rightSwipe];
  [self.view addGestureRecognizer:self.downSwipe];
  [self.view addGestureRecognizer:self.upSwipe];
  
  timeInt = 20;
  scoreInt = 0;
  modeInt = 0;
  
  self.timeLabel.text = [NSString stringWithFormat:@"Time: %i", timeInt];
  self.scoreLabel.text = [NSString stringWithFormat:@"Score %i", scoreInt];
  
}

-(void)actionGesture{
  
}

//swipe관련 메서드
-(void)handleSwipe:(UISwipeGestureRecognizer *)sender{
  
  if (modeInt == 1){
    
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
      
      NSLog(@"Left Geture");
      [simonTimer invalidate];
      
      if ([self.saysLabel.text isEqualToString:@"Simon Says Swipe Left"])
      {
        scoreInt += 1;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score %i", scoreInt];
        [self simonSays];
      } else {
        scoreInt -= 1;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score %i", scoreInt];
        [self simonSays];
      }
    }
    
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
      
      NSLog(@"Right Geture");
      
      [simonTimer invalidate];
      
      
      if ([self.saysLabel.text isEqualToString:@"Simon Says Swipe Right"])
      {
        scoreInt += 1;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score %i", scoreInt];
        [self simonSays];
      } else {
        scoreInt -= 1;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score %i", scoreInt];
        [self simonSays];
      }
    }
    
    if (sender.direction == UISwipeGestureRecognizerDirectionUp) {
      
      NSLog(@"Up Geture");
      
      [simonTimer invalidate];
      
      if ([self.saysLabel.text isEqualToString:@"Simon Says Swipe Up"])
      {
        scoreInt += 1;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score %i", scoreInt];
        [self simonSays];
      } else {
        scoreInt -= 1;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score %i", scoreInt];
        [self simonSays];
      }
    }
    
    if (sender.direction == UISwipeGestureRecognizerDirectionDown) {
      NSLog(@"Down Geture");
      
      [simonTimer invalidate];
      
      if ([self.saysLabel.text isEqualToString:@"Simon Says Swipe Down"])
      {
        scoreInt += 1;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score %i", scoreInt];
        [self simonSays];
      } else {
        scoreInt -= 1;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score %i", scoreInt];
        [self simonSays];
      }
    }
    
    
  }
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


- (IBAction)startGame:(id)sender {
  
  //gameButton을 눌렀을시 진행되는 액션
  if (timeInt == 20) {
    
    //timer활성화
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    
    //game 버튼 컨트롤
    [self.startGameButton setTitle:@"Now Processing..." forState:UIControlStateNormal];
    self.startGameButton.enabled = NO;
    self.startGameButton.alpha = 0.5;
    
    [self simonSays];
    
    modeInt = 1;
  }
  
  //
  if (timeInt == 0) {
    timeInt = 20;
    scoreInt = 0;
    
    self.timeLabel.text = [NSString stringWithFormat:@"Time: %i", timeInt];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", scoreInt];
    
    [self.startGameButton setTitle:@"Start Game" forState:UIControlStateNormal];
    
    self.saysLabel.text = @"Simon Says";
    
  }
}


//simonsays 를 표기하는 메서드
-(void)simonSays {
  NSArray *array = @[@"Simon Says Swipe Right",
                     @"Simon Says Swipe Left",
                     @"Simon Says Swipe Up",
                     @"Simon Says Swipe Down",
                     @"Swipe Right",
                     @"Swipe Left",
                     @"Swipe Up",
                     @"Swipe Down",
                     ];
  
  int randomWord = arc4random() % array.count;
  self.saysLabel.text = array[randomWord];
  
  simonTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(simonSays) userInfo:nil repeats:NO];
}


-(void)updateTimer {
  timeInt -= 1;
  self.timeLabel.text = [NSString stringWithFormat:@"Time: %i", timeInt];
  
  if (timeInt == 0) {
    [timer invalidate];
    [simonTimer invalidate];
    
    modeInt = 0;
    
    self.startGameButton.enabled = YES;
    self.startGameButton.alpha = 1.0;
    [self.startGameButton setTitle:@"Restart" forState:UIControlStateNormal];
  }
  
}









@end
