//
//  URLSchmeVC.m
//  DispatchSample
//
//  Created by Samuel K on 2018. 5. 10..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "URLSchmeVC.h"

@interface URLSchmeVC ()

@end

@implementation URLSchmeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)openURL:(NSString *)urlString {
  
  NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
  
  if (url && [[UIApplication sharedApplication] canOpenURL:url]) {
    
    //iOS 10
    if ([UIApplication instancesRespondToSelector:@selector(openURL:options:completionHandler:)]) {
      
      [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
        if (success) {
          //success code..
        }
      }];
    }
  } else {
    if ([[UIApplication sharedApplication] openURL:url]) {
      //sucess code..
    }
  }

  
}

- (IBAction)openWebsite:(id)sender {
  
  [self openURL:@"https://www.apple.co.kr"];
  
  
}

- (IBAction)openEmail:(id)sender {
  
  [self openURL:@"mailto:sky4411v@gmail.com"];
  
}

- (IBAction)openPhone:(id)sender {
  
  [self openURL:@"tel:010-9369-9097"];
  
}

- (IBAction)openSMS:(id)sender {
  [self openURL:@"sms:010-9369-9097"];
}

- (IBAction)openFaceTime:(id)sender {
  [self openURL:@"facetime://sky4411v@gmail.com"];
}


- (IBAction)openFaceAudio:(id)sender {
  [self openURL:@"facetime-audio://sky4411v@gmail.com"];
}

- (IBAction)openMap:(id)sender {
  
  [self openURL:@"http://maps.apple.com/?q=LA+dodgers+stadium"];
  
}
- (IBAction)openAppStore:(id)sender {
  
  [self openURL:@"items://itunes.apple.com/us/app/apple-store/id640199958?mt=8"];
}
@end
