//
//  MemoCell.h
//  MemoryApp
//
//  Created by Samuel K on 2018. 4. 25..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemoCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *titleLB;

@property (nonatomic, strong) IBOutlet UILabel *contentsLB;

@property (nonatomic, strong) IBOutlet UILabel *dateLB;

@end
