//
//  URLSchmeVC.h
//  DispatchSample
//
//  Created by Samuel K on 2018. 5. 10..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface URLSchmeVC : UIViewController

-(void)openURL:(NSString *)urlString;

- (IBAction)openWebsite:(id)sender;
- (IBAction)openEmail:(id)sender;

- (IBAction)openPhone:(id)sender;
- (IBAction)openSMS:(id)sender;
- (IBAction)openFaceTime:(id)sender;
- (IBAction)openFaceAudio:(id)sender;
- (IBAction)openMap:(id)sender;
- (IBAction)openAppStore:(id)sender;


@end
