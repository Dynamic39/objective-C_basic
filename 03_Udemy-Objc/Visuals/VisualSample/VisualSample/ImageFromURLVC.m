//
//  ImageFromURLVC.m
//  VisualSample
//
//  Created by Samuel K on 2018. 4. 17..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ImageFromURLVC.h"

@interface ImageFromURLVC ()

@end

@implementation ImageFromURLVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
  self.URLImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://cfile22.uf.tistory.com/image/23390C4752A91485368E42"]]];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
  
  
}


@end
