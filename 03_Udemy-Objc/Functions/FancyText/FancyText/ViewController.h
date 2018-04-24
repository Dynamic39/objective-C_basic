//
//  ViewController.h
//  FancyText
//
//  Created by Samuel K on 2018. 4. 12..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
  //class내에서 사용될 변수를 설정한다.
  CGFloat fontSize;
  BOOL state;
  
}

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *shadowButton;

- (IBAction)enterText:(id)sender;

- (IBAction)red:(id)sender;
- (IBAction)blue:(id)sender;
- (IBAction)green:(id)sender;

- (IBAction)font1:(id)sender;
- (IBAction)font2:(id)sender;
- (IBAction)font3:(id)sender;
- (IBAction)font4:(id)sender;

- (IBAction)shadow:(id)sender;

- (IBAction)small:(id)sender;
- (IBAction)medium:(id)sender;
- (IBAction)large:(id)sender;


@end

