//
//  ViewController.m
//  01_Quiz
//
//  Created by Samuel K on 2018. 4. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//정수와 두개의 배열 포인터 선언
@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@end

@implementation ViewController
//아웃렛 연결부분
{
  
  __weak IBOutlet UILabel *questionLabel;
  __weak IBOutlet UILabel *answerLabel;
  
}

-(IBAction)showQuestion:(id)sender
{
  
}

-(IBAction)showAnswer:(id)sender
{
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
