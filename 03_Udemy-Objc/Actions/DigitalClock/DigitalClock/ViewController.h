//
//  ViewController.h
//  DigitalClock
//
//  Created by Samuel K on 2018. 4. 13..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//클래스내 변수 설정
{
  
  NSTimer *timer;

}

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIView *settingView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *clockColor;
@property (weak, nonatomic) IBOutlet UISegmentedControl *backgroundColor;
@property (weak, nonatomic) IBOutlet UIButton *settingButton;


- (IBAction)clockSeg:(id)sender;
- (IBAction)backgroundSeg:(id)sender;
- (IBAction)settings:(id)sender;



@end

