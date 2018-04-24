//
//  ViewController.m
//  Calculator
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


//숫자 눌렀을때 실행 메서드
- (IBAction)digitPressed:(id)sender {
  
  currentNumber = currentNumber *10 + (float)[sender tag];
  self.resultLabel.text = [NSString stringWithFormat:@"%6.0f", currentNumber];
  
}

//C 를 눌렀을때 실행 메서드
- (IBAction)cancelOperation:(id)sender {
  
  currentNumber = 0;
  result = 0;
  self.resultLabel.text = @"0";
  
}

//연산자를 눌렀을 때, 실행 메서드
- (IBAction)opearationPressed:(id)sender {
  
  if (currentOperation == 0) result = currentNumber;
  else {
    switch (currentOperation) {
      case 1:
        result = result + currentNumber;
        break;
      case 2:
        result = result - currentNumber;
        break;
      case 3:
        result = result * currentNumber;
        break;
      case 4:
        result = result / currentNumber;
        break;
      default:
        break;
    }
  }
  
  //연산 오퍼레이트를 실행 한 후 마지막에 정리한다.
  currentNumber = 0;
  self.resultLabel.text = [NSString stringWithFormat:@"%6.0f", result];
  
  if ([sender tag] == 0) result = 0; {
    currentOperation = (int)[sender tag];
  }
  
}


@end
