//
//  FirstViewController.m
//  MCDemo(chatApp)
//
//  Created by Samuel K on 2018. 4. 10..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"

@interface FirstViewController ()

//프로퍼티 생성
@property (nonatomic, strong) AppDelegate *appDelegate;

//Notification에서 받는 메서드 설정
-(void)didReceiveDataWithNotification:(NSNotification *)notification;

-(void)sendMyMessage;

@end

@implementation FirstViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  //mcManager에 접근하기 위하여 작성하여 준다.
  _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  _txtMessage.delegate = self;
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveDataWithNotification:) name:@"MCDidReceiveDataNotification" object:nil];
  
  
}

#pragma mark - Class Methods

-(void)didReceiveDataWithNotification:(NSNotification *)notification
{
  MCPeerID *peerID = [[notification userInfo] objectForKey:@"peerID"];
  NSString *peerDisplayName = peerID.displayName;
  
  NSData *receivedData = [[notification userInfo] objectForKey:@"data"];
  NSString *receivedText = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
  
  [_tvChat performSelectorOnMainThread:@selector(setText:) withObject:[_tvChat.text stringByAppendingString:[NSString stringWithFormat:@"%@ wrote: \n%@\n\n", peerDisplayName, receivedText]] waitUntilDone:NO];
}





- (void)sendMyMessage
{
  NSData *dataToSend = [_txtMessage.text dataUsingEncoding:NSUTF8StringEncoding];
  NSArray *allPeers = _appDelegate.mcManager.session.connectedPeers;
  NSError *error;
  
  [_appDelegate.mcManager.session sendData:dataToSend
                                   toPeers:allPeers
                                  withMode:MCSessionSendDataReliable
                                     error:&error];
  
  if (error)
  {
    NSLog(@"%@", [error localizedDescription]);
  }
  
  [_tvChat setText:[_tvChat.text stringByAppendingString:[NSString stringWithFormat:@"I wrote: \n%@\n\n", _txtMessage.text]]];
  [_txtMessage setText:@""];
  [_txtMessage resignFirstResponder];
}




#pragma mark - Action Methods

- (void)sendMessage:(id)sender
{
  [self sendMyMessage];
}

- (void)cancelMessage:(id)sender
{
  [_txtMessage resignFirstResponder];
}

#pragma mark - Textfield Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
  [self sendMyMessage];
  return YES;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
