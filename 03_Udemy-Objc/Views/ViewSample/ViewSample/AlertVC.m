//
//  AlertVC.m
//  ViewSample
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "AlertVC.h"

@interface AlertVC ()

@end

@implementation AlertVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


- (IBAction)alertView:(id)sender {
  
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Title" message:@"Message" preferredStyle:UIAlertControllerStyleAlert];
  
  UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    self.alertLabel.text = @"OK button Clicked";
  }];
  
  UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    
    self.alertLabel.text = @"CANCEL button Clicked";
    [alert dismissViewControllerAnimated:TRUE completion:nil];
    
  }];
  
  [alert addAction:okAction];
  [alert addAction:cancelAction];
  
  [self presentViewController:alert animated:YES completion:nil];
  
  
}
@end
