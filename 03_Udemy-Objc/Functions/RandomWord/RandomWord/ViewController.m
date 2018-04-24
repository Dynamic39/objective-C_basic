//
//  ViewController.m
//  RandomWord
//
//  Created by Samuel K on 2018. 4. 13..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  
}


- (IBAction)randomWord:(id)sender {
  
  //배열 초기화
  NSArray *words = @[@"Apple", @"Banana", @"Lemon", @"Tomato"];
  //임의 문자가지고 오기
  int randomWord = arc4random() % words.count;
  self.label.text = words[randomWord];
  
}





@end
