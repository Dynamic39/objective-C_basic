//
//  ViewController.h
//  Calculator
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
  //현재 연산자
  int currentOperation;
  float result;
  //현재까지 연산결과를 저장
  float currentNumber;
  //
  
}
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

- (IBAction)digitPressed:(id)sender;
- (IBAction)cancelOperation:(id)sender;
- (IBAction)opearationPressed:(id)sender;

@end

