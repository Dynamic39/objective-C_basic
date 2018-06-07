//
//  SecondViewController.h
//  DevslopesTutorials
//
//  Created by Samuel K on 2018. 5. 4..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>

//Data를 주는 곳에서 Protocol을 만든다.
@protocol TextfieldContentsPassDelegate <NSObject>

-(void)toPassData:(NSString *)textfieldContent;

@end


@interface SecondViewController : UIViewController


//Protocol을 받을 변수를 설정한다.
@property (nonatomic, strong) id <TextfieldContentsPassDelegate> delegate;
@property (nonatomic, strong) IBOutlet UITextField *inpuTF;

- (IBAction)saveData:(id)sender;

@end
