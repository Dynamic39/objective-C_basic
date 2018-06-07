//
//  ViewController.h
//  DevslopesTutorials
//
//  Created by Samuel K on 2018. 5. 4..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"


//Delegate를 사용할 곳에서 Protocol을 채택한다.
@interface ViewController : UIViewController <TextfieldContentsPassDelegate>

@property (nonatomic, strong) IBOutlet UILabel *ResultLabel;

@end

