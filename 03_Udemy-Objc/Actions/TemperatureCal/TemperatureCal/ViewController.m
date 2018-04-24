//
//  ViewController.m
//  TemperatureCal
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
  // Dispose of any resources that can be recreated.
}


//텍스트 필드를 완성하면 실행되는 액션 메서드
- (IBAction)calculate:(id)sender {
  
  //segcontrol에 따라 적절한 값을 주는 if문을 작성한다.
  if (self.tempChangeSegControl.selectedSegmentIndex == 0) {
    
    //변수 설정(F -> C)
    double fahrenheit = [self.textField.text doubleValue]; // F - double로 설정
    double celsius = (fahrenheit - 32) / 1.8; // F -> C change 서식을 넣어준다.
    self.tempOutputLabel.text = [NSString stringWithFormat:@"%3.2f Celsius", celsius];
    
    //온도에 따른 이미지를 설정한다.
    [self imageSelector:celsius];
    
    
  } else {
    
    //C -> F로 변환하는 서식을 넣어준다.
    double celsius = [self.textField.text doubleValue];
    double fahrenheit = celsius * 1.8 + 32;
    self.tempOutputLabel.text = [NSString stringWithFormat:@"%3.2f fahrenheit", fahrenheit];
    
    [self imageSelector:celsius];
    
  }
}

-(void)imageSelector:(double)celsius {
  
  //온도에 맞는 값을 설정한다.
  if (celsius > 120) {
    self.tempImageView.image = [UIImage imageNamed:@"Temp9"];
  } else if (celsius > 100) {
    self.tempImageView.image = [UIImage imageNamed:@"Temp8"];
  } else if (celsius > 80) {
    self.tempImageView.image = [UIImage imageNamed:@"Temp7"];
  } else if (celsius > 60) {
    self.tempImageView.image = [UIImage imageNamed:@"Temp6"];
  } else if (celsius > 40) {
    self.tempImageView.image = [UIImage imageNamed:@"Temp5"];
  } else if (celsius > 20) {
    self.tempImageView.image = [UIImage imageNamed:@"Temp4"];
  } else if (celsius > 0) {
    self.tempImageView.image = [UIImage imageNamed:@"Temp3"];
  } else if (celsius > -20) {
    self.tempImageView.image = [UIImage imageNamed:@"Temp2"];
  } else if (celsius < -20 ) {
    self.tempImageView.image = [UIImage imageNamed:@"Temp1"];
  }
  
}

- (IBAction)switchConversion:(id)sender {
  
  //segIndex 가 바뀔때 다른 글씨가 보이도록 한다.
  if (self.tempChangeSegControl.selectedSegmentIndex == 0){
    self.enterLabel.text = @"Enter Fahrenheit";
    self.textField.text = @"0";
    self.tempOutputLabel.text = @"0 Celsius";
  } else {
    self.enterLabel.text = @"Enter Celsius";
    self.textField.text = @"0";
    self.tempOutputLabel.text = @"0 Fahrenheit";
  }
  
  
}
@end
