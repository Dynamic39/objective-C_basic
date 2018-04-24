//
//  ViewController.h
//  RandomNumberGen
//
//  Created by Samuel K on 2018. 4. 13..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;

- (IBAction)random0100:(id)sender;
- (IBAction)random1020:(id)sender;


@end

