//
//  MemoReadVC.m
//  MemoryApp
//
//  Created by Samuel K on 2018. 4. 24..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "MemoReadVC.h"

@interface MemoReadVC ()

@end

@implementation MemoReadVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
  self.detailtextLB.text = self.detailtextString;
  self.detailtextview.text = self.textviewString;
  
}


@end
