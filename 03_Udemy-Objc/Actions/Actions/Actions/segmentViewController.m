//
//  segmentViewController.m
//  Actions
//
//  Created by Samuel K on 2018. 4. 13..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "segmentViewController.h"

@interface segmentViewController ()

@end

@implementation segmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segmentAction:(id)sender {
  
  [self segmentControl:sender];
    
}

-(void)segmentControl: (UISegmentedControl *)segIndex {
  self.segLabel.text = [NSString stringWithFormat:@"Segment [%li] was selected", (long)segIndex.selectedSegmentIndex];
}
@end
