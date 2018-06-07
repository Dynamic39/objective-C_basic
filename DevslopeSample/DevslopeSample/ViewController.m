//
//  ViewController.m
//  DevslopeSample
//
//  Created by Samuel K on 2018. 5. 4..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"
#import "Honda+SupedUp.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  //카테고리 사용
  
  Honda *honda = [[Honda alloc] init];
  [honda addUglySpoiler]; // Catergory Honda Class (inheritance from Honda Class)
  [honda increaseMilesToOdemeter]; // Original Honda Class
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
