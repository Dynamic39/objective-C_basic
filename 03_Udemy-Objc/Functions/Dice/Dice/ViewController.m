//
//  ViewController.m
//  Dice
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
  
  isSpin = NO;
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  
}


//버튼을 클릭 했을 때 작동하는 액션 메서드
- (IBAction)roll:(id)sender {
  
  
  [self spinDice];
  
}

-(void)spinDice{
  
  if (isSpin == NO) {
    [self.button setTitle:@"STOP" forState:UIControlStateNormal];
    nsTimer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(spinImageView) userInfo:NULL repeats:YES];
    isSpin = YES;
  } else {
    [nsTimer invalidate];
    isSpin = NO;
    [self.button setTitle:@"ROLL" forState:UIControlStateNormal];
  }
  
}

-(void)spinImageView{
  
  int min = 1;
  int max = 6;
  
  int randomNum = arc4random_uniform(max - min) + min;
  
  self.label.text = [NSString stringWithFormat:@"Rolled a %i", randomNum];
  self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"Dice%i" , randomNum]];
  
//  switch (randomNum) {
//    case 1:
//      self.imageView.image = [UIImage imageNamed:@"Dice1"];
//      break;
//    case 2:
//      self.imageView.image = [UIImage imageNamed:@"Dice2"];
//      break;
//    case 3:
//      self.imageView.image = [UIImage imageNamed:@"Dice3"];
//      break;
//    case 4:
//      self.imageView.image = [UIImage imageNamed:@"Dice4"];
//      break;
//    case 5:
//      self.imageView.image = [UIImage imageNamed:@"Dice5"];
//      break;
//    case 6:
//      self.imageView.image = [UIImage imageNamed:@"Dice6"];
//      break;
//    default:
//      break;
//  }
  
}


@end
