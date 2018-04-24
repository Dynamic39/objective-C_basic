//
//  ViewController.m
//  TrafficLights
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
  
  self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  
}


- (IBAction)startStop:(id)sender {
  
  if (scoreInt == 0)
  {
    
    timerInt = 3;
    [self trafficSignalImage:@"trafficLight"];
    //타이머 진행
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startCounter) userInfo:nil repeats:YES];
    self.startButton.enabled = NO;
    [self.startButton setTitle:@"" forState:UIControlStateNormal];
    
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
    
  } else
  {
    [scoreTimer invalidate];
    [self.startButton setTitle:@"Restart" forState:UIControlStateNormal];
  }
  
  if (timerInt == 0)
  {
    scoreInt = 0;
    timerInt = 3;
  }
  
}

//카운터를 진행하는 메서드
-(void)startCounter
{
  //1씩 깎는다.
  timerInt -= 1;
  
  if (timerInt == 2)
  {
    [self trafficSignalImage:@"trafficLight3"];
  } else if (timerInt == 1)
  {
    [self trafficSignalImage:@"trafficLight2"];
  } else if (timerInt == 0)
  {
    [self trafficSignalImage:@"trafficLight1"];
    
    //중복 적용이 되지 않도록 초기화 시켜 준다.
    [timer invalidate];
    self.startButton.enabled = YES;
    [self.startButton setTitle:@"Stop" forState:UIControlStateNormal];
    scoreTimer = [NSTimer scheduledTimerWithTimeInterval:0.0001 target:self selector:@selector(scoreCounter) userInfo:nil repeats:YES];
  }

}

-(void)trafficSignalImage:(NSString *)trafficeLights
{
  self.trafficLights.image = [UIImage imageNamed:trafficeLights];
}

//스코어 카운터를 작성한다.
-(void)scoreCounter
{
  scoreInt += 1;
  self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
}


@end
