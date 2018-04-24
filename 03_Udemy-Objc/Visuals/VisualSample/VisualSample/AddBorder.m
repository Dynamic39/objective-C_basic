//
//  AddBorder.m
//  VisualSample
//
//  Created by Samuel K on 2018. 4. 17..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "AddBorder.h"

@interface AddBorder ()

@end

@implementation AddBorder

- (void)viewDidLoad {
    [super viewDidLoad];
  
  //보더 설정 및 색상 선정
  [[self.addbImageView layer] setBorderWidth:10.0f];
  [[self.addbImageView layer] setBorderColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.5].CGColor];
  
  [[self.addbImageView layer] setCornerRadius:10.f];
  [[self.addbImageView layer] setMasksToBounds:YES];
  
  //Shadow 설정
  self.addImageView2.layer.shadowColor = [[UIColor blackColor] CGColor];
  self.addImageView2.layer.shadowOpacity = 0.5;
  self.addImageView2.layer.shadowRadius = 5.0f;
  self.addImageView2.layer.shadowOffset = CGSizeMake(5, 5);
  
  
  
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


@end
