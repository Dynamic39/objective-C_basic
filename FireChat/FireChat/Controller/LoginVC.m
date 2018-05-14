//
//  LoginVC.m
//  FireChat
//
//  Created by Samuel K on 2018. 4. 26..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()

//property
@property (weak, nonatomic) IBOutlet UITextField *nameField;

//action
- (IBAction)loginButton:(id)sender;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
  
  
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

- (void)viewDidAppear:(BOOL)animated{
  [super viewDidAppear:YES];
  self.navigationController.navigationBar.hidden = YES;
}


- (IBAction)loginButton:(id)sender {
  
  if (![self.nameField.text isEqual: @""]) {
    
    //익명 로그인
    [[FIRAuth auth] signInAnonymouslyWithCompletion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
      
      BOOL isAnonymous = user.anonymous; // 익명의 사용자 승인
      NSString *uid = user.uid; // uid 사용
      NSLog(@"Error : %@", error.description);
      
      [self performSegueWithIdentifier:@"LoginToChat" sender:nil];
      
    }];
    
    
  }
  
  
}
@end
