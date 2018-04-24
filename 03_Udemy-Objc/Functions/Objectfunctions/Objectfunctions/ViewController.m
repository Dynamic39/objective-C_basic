//
//  ViewController.m
//  Objectfunctions
//
//  Created by Samuel K on 2018. 4. 12..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.label.text = @"Apple";
  self.textView.text = @"Banana";
  
  
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  
}

//textfield의 작업이 끝난 후 실행되는 액션 메서드
- (IBAction)enterText:(id)sender {
  
  self.label.text = self.textField.text;
  //dismiss keyboard
  [self resignFirstResponder];
  
}

//액션 버튼 생성
- (IBAction)setColor:(id)sender {
  
  self.label.textColor = [UIColor redColor];
  
}

- (IBAction)setBackground:(id)sender {
  
  if (self.label.backgroundColor == [UIColor blackColor])
  {
    self.label.backgroundColor = [UIColor clearColor];
  } else
  {
    self.label.backgroundColor = [UIColor blackColor];
  }
  
}

- (IBAction)fontSize:(id)sender {
  
  [self.label setFont:[UIFont fontWithName:@"Futura" size:30]];
  
}

- (IBAction)dropShadow:(id)sender {
  
  //drop shadow
  self.label.layer.shadowColor = [[UIColor blackColor] CGColor];
  //shadow의 진하기
  self.label.layer.shadowOpacity = 0.5;
  //shadow의 radius
  self.label.layer.shadowRadius = 1.0f;
  //shadow의 오프셋 설정
  //기본 오른쪽, 아래로 설정됨
  self.label.layer.shadowOffset = CGSizeMake(-2, -2);
  
}

//shadow color를 설정함.
- (IBAction)shadowColor:(id)sender {
  
  self.label.layer.shadowColor = [[UIColor blueColor] CGColor];
  
}


- (IBAction)center:(id)sender {
  
  self.label.textAlignment = NSTextAlignmentCenter;
  
}

- (IBAction)left:(id)sender {
  
  self.label.textAlignment = NSTextAlignmentLeft;
  
}

- (IBAction)right:(id)sender {
  
  self.label.textAlignment = NSTextAlignmentRight;
  
}

//textView의 done버튼을 눌렀을때, 키보드를 내려주는 역할을 한다.
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
  
  if ([text rangeOfCharacterFromSet:[NSCharacterSet newlineCharacterSet]].location == NSNotFound)
  {
    return YES;
  }
  [textView resignFirstResponder];
  return NO;
  
}







@end
