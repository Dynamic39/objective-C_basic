//
//  ViewController.m
//  NSTimers
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
  
  countInt = 0;
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


-(void)startTimer
{
  timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
}

- (IBAction)start:(id)sender {
  
  //NStimer로 추적한다.
  [self startTimer];
  //현재 viewController내에서 특정 메서드를 반복하는 메서드
  

}

-(void)updateTimer {
  countInt += 1;
  //Int값을 NSString으로 변환하여 진행한다.
  self.label.text = [NSString stringWithFormat: @"%i", countInt];
}

- (IBAction)pause:(id)sender {
  
  [timer invalidate];
  
}

- (IBAction)restart:(id)sender {
  
  [timer invalidate];
  
  countInt = 0;
  self.label.text = [NSString stringWithFormat:@"%i", countInt];
  
  [self startTimer];
}
@end
