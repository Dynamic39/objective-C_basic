//
//  VibrateVC.m
//  AVSample
//
//  Created by Samuel K on 2018. 4. 17..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "VibrateVC.h"

@interface VibrateVC ()


@end

@implementation VibrateVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


- (IBAction)vibrate:(id)sender {
  
  AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
  
  
  
}
@end
