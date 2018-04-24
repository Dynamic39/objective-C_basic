//
//  UIPickerVC.m
//  ViewSample
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "UIPickerVC.h"

@interface UIPickerVC ()
{
  // .h file에서 <delegate> 를 선언한다.
  NSArray *array;
  
}
@end

@implementation UIPickerVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
  self.pickerView.delegate = self;
  self.pickerView.dataSource = self;
  
  //컴포넌트를 구성하는 배열을 생성한다.
  array = @[@"Apple", @"Banana", @"Orange", @"Grape", @"Blueberry"];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIPickerView Delegate

//선택되었을 때, 실행하는 메서드
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
 
  self.pickerLabel.text = [array objectAtIndex:row];
  
}

//Component -> Rows
//컴포넌트를 구성하는 열의 숫자를 지정
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
  return array.count;
}

//각 컴포넌트의 수를 설정
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
  return 1;
}

//titleForRow 설정
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  
  return array[row];
  
}



@end
