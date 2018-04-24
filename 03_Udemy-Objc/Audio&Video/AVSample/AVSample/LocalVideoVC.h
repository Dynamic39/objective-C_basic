//
//  LocalVideoVC.h
//  AVSample
//
//  Created by Samuel K on 2018. 4. 17..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface LocalVideoVC : ViewController

- (IBAction)playVideo:(id)sender;
- (IBAction)streamVideo:(id)sender;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
