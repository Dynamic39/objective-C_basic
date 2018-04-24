//
//  UIControlVC.m
//  ViewSample
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "UIControlVC.h"

@interface UIControlVC ()

@end

@implementation UIControlVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//스크롤 뷰 컨트롤
- (void)viewDidAppear:(BOOL)animated {
  
  //컨텐츠 사이즈 설정(x축, y축)
  [self.scrollView setContentSize:CGSizeMake(0, 1500)];
  
}

@end
