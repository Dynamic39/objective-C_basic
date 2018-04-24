//
//  AnimationVC.m
//  VisualSample
//
//  Created by Samuel K on 2018. 4. 17..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "AnimationVC.h"

@interface AnimationVC ()

@end

@implementation AnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


- (IBAction)playAnimation:(id)sender {
  
  //animation arrays
  NSArray *animationArrays = @[
                               @"image1",
                               @"image2",
                               @"image3",
                               @"image4",
                               @"image5",
                               ];
  
  self.animationImageView.animationImages = animationArrays;
  
  [self.animationImageView setAnimationRepeatCount:5];
  self.animationImageView.animationDuration = 1;
  [self.animationImageView startAnimating];
  
}
@end
