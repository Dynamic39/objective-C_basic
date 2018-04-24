//
//  ViewController.h
//  TrafficLights
//
//  Created by Samuel K on 2018. 4. 12..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
  NSTimer *timer;
  NSTimer *scoreTimer;
  
  int timerInt;
  int scoreInt;
}

@property (weak, nonatomic) IBOutlet UIImageView *trafficLights;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

- (IBAction)startStop:(id)sender;

@end

