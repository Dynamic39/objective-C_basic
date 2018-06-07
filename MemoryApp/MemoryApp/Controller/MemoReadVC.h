//
//  MemoReadVC.h
//  MemoryApp
//
//  Created by Samuel K on 2018. 4. 24..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemoReadVC : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *detailtextLB;
@property (weak, nonatomic) IBOutlet UITextView *detailtextview;
@property (weak, nonatomic) IBOutlet UIImageView *detailImageview;

@property (strong, nonatomic) NSString *detailtextString;
@property (strong, nonatomic) NSString *textviewString;


@end
