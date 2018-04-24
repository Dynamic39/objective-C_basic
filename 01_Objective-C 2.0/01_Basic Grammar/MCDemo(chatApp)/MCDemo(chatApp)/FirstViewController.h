//
//  FirstViewController.h
//  MCDemo(chatApp)
//
//  Created by Samuel K on 2018. 4. 10..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITextFieldDelegate>

//아웃렛 설정
@property (weak, nonatomic) IBOutlet UITextField *txtMessage;
@property (weak, nonatomic) IBOutlet UITextView *tvChat;

//메서드 설정
-(IBAction)sendMessage:(id)sender;
-(IBAction)cancelMessage:(id)sender;


@end

