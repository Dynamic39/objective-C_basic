//
//  ViewController.m
//  ImageGallery
//
//  Created by Samuel K on 2018. 4. 17..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
  int imageInt;
  
}

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  imageInt = 1;
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  
}


- (IBAction)nextAction:(id)sender {
  
  imageInt += 1;
  [self imageGallery];
  
  if (imageInt > 6) {
    imageInt = 6;
    [self imageGallery];
  }
  
}

- (IBAction)backAction:(id)sender {
  
  imageInt -= 1;
  [self imageGallery];
  
  if (imageInt < 1) {
    imageInt = 1;
    [self imageGallery];
  }
  
}

//image를 가지고 오는 메서드를 구현한다.
-(void)imageGallery {
  
  self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"Image%i", imageInt]];
  self.pageLabel.text = [NSString stringWithFormat:@"%i/6", imageInt];
  
}











@end
