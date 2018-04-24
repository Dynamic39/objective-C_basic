//
//  URLLinksVC.m
//  Actions
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "URLLinksVC.h"

@interface URLLinksVC ()

@end

@implementation URLLinksVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


- (IBAction)urlLink:(id)sender {
  
  //urlLink를 여는 화면을 설정한다.
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.google.com"] options:@{} completionHandler:nil];
  
}
@end
