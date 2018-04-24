//
//  ViewController.h
//  ViewSample
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *theView;


- (IBAction)showView:(id)sender;
- (IBAction)hideView:(id)sender;



@end

