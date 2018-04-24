//
//  ViewController.m
//  SDImageSample
//
//  Created by Samuel K on 2018. 4. 23..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"
//#import <SDWebImage/UIImageView+WebCache.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self.SDImageview sd_setImageWithURL:[NSURL URLWithString:@"https://www.google.co.kr/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"] placeholderImage:[UIImage imageNamed:@"sample.png"]];
  
  self.SDImageview.contentMode = UIViewContentModeScaleAspectFit;
  self.SDImageview.clipsToBounds = YES;
  
  //cashe 이미지 인스턴스
  [SDImageCache sharedImageCache];
  
  SDImageCache *imageCashe = [[SDImageCache alloc] init];
  
  //경로 확인?
  [imageCashe addReadOnlyCachePath:<#(nonnull NSString *)#>]
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


- (IBAction)saveImageBtn:(id)sender {
  
  
  self.sdsampleImageview.image = [UIImage imageNamed:@"sample.png"];
  
}

@end
