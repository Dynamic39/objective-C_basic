//
//  ChatCell.h
//  FireChat
//
//  Created by Samuel K on 2018. 4. 26..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;

@interface ChatCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *chatTitleTF;

- (IBAction)createNewBtn:(id)sender;



@end
