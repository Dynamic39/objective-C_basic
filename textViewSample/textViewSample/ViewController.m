//
//  ViewController.m
//  textViewSample
//
//  Created by Samuel K on 2018. 6. 4..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textView.delegate = self;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
    
    
}

-(void)textViewDidChange:(UITextView *)textView {
    
    CGFloat fixedWidth = textView.frame.size.width;
    CGSize newSize = [textView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame = textView.frame;
    newFrame.size = CGSizeMake(fmax(newSize.width, fixedWidth), newSize.height);
    textView.frame = newFrame;
    
    //_viewBottomLayout.constant = newFrame.size.height + 40;
    CGRect newHeaderViewFrame = self.headerView.frame;
    newHeaderViewFrame.size.height = newFrame.size.height + 20;
    self.headerView.frame = newHeaderViewFrame;
    
    [self.tableView reloadData];
    
    
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
