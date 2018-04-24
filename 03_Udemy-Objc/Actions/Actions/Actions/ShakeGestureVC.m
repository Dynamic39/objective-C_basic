//
//  ShakeGestureVC.m
//  Actions
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ShakeGestureVC.h"

@interface ShakeGestureVC ()

@end

@implementation ShakeGestureVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//motion 에 따라서 진행 여부 확인
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
  
  if (event.subtype == UIEventSubtypeMotionShake) {
    self.gestureLabel.text = @"The device was shaken";
  }
  
  
}


@end
