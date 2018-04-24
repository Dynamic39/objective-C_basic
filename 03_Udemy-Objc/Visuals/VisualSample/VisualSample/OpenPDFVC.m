//
//  OpenPDFVC.m
//  VisualSample
//
//  Created by Samuel K on 2018. 4. 17..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "OpenPDFVC.h"

@interface OpenPDFVC ()

@end

@implementation OpenPDFVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
  //webView를 활용하여 PDF 파일을 가져와보자.
  //path설정
  NSString *path = [[NSBundle mainBundle] pathForResource:@"Cats" ofType:@"pdf"];
  //url 설정
  NSURL *url = [NSURL fileURLWithPath:path];
  //request설정
  NSURLRequest *request =[NSURLRequest requestWithURL:url];
  //loading
  [self.webView loadRequest:request];
  
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


@end
