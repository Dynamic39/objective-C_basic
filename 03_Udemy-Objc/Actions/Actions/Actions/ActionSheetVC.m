//
//  ActionSheetVC.m
//  Actions
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ActionSheetVC.h"

@interface ActionSheetVC ()

@end

@implementation ActionSheetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionSheetHandler:(id)sender {
  
  //button을 누르면 액션시트가 발생된다.
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Title" message:@"message" preferredStyle:UIAlertControllerStyleActionSheet];
  
  //액션시트내에 삽입할 액션을 정리한다.
  UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"button1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    self.actionSheetLabel.text = @"Button 1 was pressed";
  }];

  UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"button2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    self.actionSheetLabel.text = @"Button 2 was pressed";
  }];
  
  UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){
    
    [alert dismissViewControllerAnimated:YES completion:nil];
    
  }];
  
  [alert addAction:action1];
  [alert addAction:action2];
  [alert addAction:cancel];
  
  [self presentViewController:alert animated:YES completion:nil];
  
  
  
}
@end
