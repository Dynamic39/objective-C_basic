//
//  ViewController.m
//  AVSample
//
//  Created by Samuel K on 2018. 4. 17..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
  //소리 관련 클래스 선ㄴ언
  SystemSoundID soundID;
}

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  //URL 설정
  NSURL *soundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Sound" ofType:@"wav"]];
  AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &soundID);

}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  
}


- (IBAction)playSound:(id)sender {
  
  AudioServicesPlaySystemSound(soundID);
  
}

- (IBAction)streamVideo:(id)sender {
}
@end
