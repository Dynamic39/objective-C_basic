//
//  ViewController.h
//  TemperatureCal
//
//  Created by Samuel K on 2018. 4. 13..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *enterLabel;
@property (weak, nonatomic) IBOutlet UIImageView *tempImageView;

@property (weak, nonatomic) IBOutlet UILabel *tempOutputLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tempChangeSegControl;


- (IBAction)calculate:(id)sender;
- (IBAction)switchConversion:(id)sender;


@end

