//
//  SwipeGestureVC.m
//  Actions
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "SwipeGestureVC.h"

@interface SwipeGestureVC ()

@end

@implementation SwipeGestureVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
  //스와이프 기능 추가(왼쪽)
  self.leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
  self.rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
  self.downSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
  self.upSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
  
  self.leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
  self.rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
  self.downSwipe.direction = UISwipeGestureRecognizerDirectionDown;
  self.upSwipe.direction = UISwipeGestureRecognizerDirectionUp;
  
  [self.view addGestureRecognizer:self.leftSwipe];
  [self.view addGestureRecognizer:self.rightSwipe];
  [self.view addGestureRecognizer:self.downSwipe];
  [self.view addGestureRecognizer:self.upSwipe];

}


//스와이프 시, 수행할 기능을 추가한다.
-(void)handleSwipe:(UISwipeGestureRecognizer *)sender {
  
  if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
    self.gestureLabel.text = @"Left";
  }
  if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
    self.gestureLabel.text = @"Right";
  }
  if (sender.direction == UISwipeGestureRecognizerDirectionUp) {
    self.gestureLabel.text = @"Up";
  }
  if (sender.direction == UISwipeGestureRecognizerDirectionDown) {
    self.gestureLabel.text = @"Down";
  }
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
