//
//  ViewController.h
//  ShakeMeSilly
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
  //클래스 내 변수 선언
  NSTimer *timer;
  
  int timeInt;
  int scoreInt;
  
  int modelInt;
  int imageInt;
  
  
}

//프로퍼티 설정
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *startGameButton;


- (IBAction)startGame:(id)sender;




@end

