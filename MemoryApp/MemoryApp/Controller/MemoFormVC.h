//
//  MemoFormVC.h
//  MemoryApp
//
//  Created by Samuel K on 2018. 4. 24..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemoData.h"

@class MemoFormVC;

@protocol MemoFormDelegate <NSObject>

-(void)dataHandler:(MemoData *)MemoDataModel;

@end


@interface MemoFormVC : UIViewController


@property (nonatomic, weak) id <MemoFormDelegate> delegate;

@property MemoData *passToMainListData;

@property (weak, nonatomic) IBOutlet UITextField *titleTF;
@property (weak, nonatomic) IBOutlet UITextView *mainTextview;
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;

-(void)dataDelegateHandler;

- (IBAction)save:(id)sender;


@end

