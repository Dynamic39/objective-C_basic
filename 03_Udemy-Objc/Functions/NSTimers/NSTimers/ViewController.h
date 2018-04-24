//
//  ViewController.h
//  NSTimers
//
//  Created by Samuel K on 2018. 4. 12..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
  
  //클래스 변수 선언
  NSTimer *timer;
  int countInt;
  
}

@property (weak, nonatomic) IBOutlet UILabel *label;
- (IBAction)start:(id)sender;
- (IBAction)pause:(id)sender;
- (IBAction)restart:(id)sender;

@end

