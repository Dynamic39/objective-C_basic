//
//  MemoFormVC.m
//  MemoryApp
//
//  Created by Samuel K on 2018. 4. 24..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "MemoFormVC.h"

@interface MemoFormVC ()


@property NSString *memoString;

@property (nonatomic, weak) NSString *titleString;
@property (nonatomic, weak) NSString *textViewString;


@end

@implementation MemoFormVC

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.passToMainListData = [[MemoData alloc] init];
  
  
  NSLog(@"%@", self.textViewString);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


- (void)dataDelegateHandler
{
  
  self.passToMainListData.title = self.titleTF.text;
  self.passToMainListData.contents = self.mainTextview.text;
  self.passToMainListData.regDate = [[NSDate alloc] init];
  self.passToMainListData.image = self.mainImageView.image;
  NSLog(@"titleTF: %@", self.titleTF.text);
  NSLog(@"titleTF: %@", self.mainTextview.text);
  
}

- (IBAction)save:(id)sender {
  
  [self dataDelegateHandler];
  [self.delegate dataHandler:self.passToMainListData];
  
  [self.navigationController popViewControllerAnimated:YES];
  
}




@end
