//
//  ViewController.h
//  textViewSample
//
//  Created by Samuel K on 2018. 6. 4..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *viewBottomLayout;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (assign, nonatomic) IBOutlet UIView *headerView;

@end

