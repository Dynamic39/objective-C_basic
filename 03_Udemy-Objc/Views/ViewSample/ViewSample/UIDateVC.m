//
//  UIDateVC.m
//  ViewSample
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "UIDateVC.h"

@interface UIDateVC ()

@end

@implementation UIDateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


- (IBAction)datePicker:(id)sender {
  
  //date설정
  NSDateFormatter *dateFommat = [[NSDateFormatter alloc] init];
  [dateFommat setDateFormat:@"EEEE MM/dd/yyyy"]; // dateFormat Setting
  
  self.dateLabel.text = [dateFommat stringFromDate:self.datePicker.date];
  
  

}
@end
