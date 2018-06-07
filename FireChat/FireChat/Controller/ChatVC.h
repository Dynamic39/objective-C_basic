//
//  ChatVC.h
//  FireChat
//
//  Created by Samuel K on 2018. 5. 2..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
#import <JSQMessagesViewController.h>
#import "Channel.h"

@interface ChatVC : JSQMessagesViewController

@property (nonatomic, strong) FIRDatabaseReference *channelRef;
@property (nonatomic, strong) Channel *channel;
@property (nonatomic, strong) NSString *senderDiplayName;

@end
