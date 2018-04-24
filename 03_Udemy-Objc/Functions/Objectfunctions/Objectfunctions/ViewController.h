//
//  ViewController.h
//  Objectfunctions
//
//  Created by Samuel K on 2018. 4. 12..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)enterText:(id)sender;

- (IBAction)setColor:(id)sender;
- (IBAction)setBackground:(id)sender;
- (IBAction)fontSize:(id)sender;
- (IBAction)dropShadow:(id)sender;
- (IBAction)shadowColor:(id)sender;
- (IBAction)center:(id)sender;
- (IBAction)left:(id)sender;
- (IBAction)right:(id)sender;


@end

