//
//  MCManager.m
//  MCDemo(chatApp)
//
//  Created by Samuel K on 2018. 4. 10..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "MCManager.h"

@implementation MCManager

-(id)init
{
  self = [super init];
  
  if(self)
  {
    _peerID = nil;
    _session = nil;
    _browser = nil;
    _advertiser = nil;
  }
  return self;
}

//DisplayName설정, MC delegate를 사용중,
- (void)setupPeerAndSessionWithDisplayName:(NSString *)displayName
{
  _peerID = [[MCPeerID alloc] initWithDisplayName:displayName];
  _session = [[MCSession alloc] initWithPeer:_peerID];
  _session.delegate = self;
}

//처음 시작할때 생성되는 브라우저
- (void)setupMCBrowser
{
  _browser = [[MCBrowserViewController alloc] initWithServiceType:@"chat-files" session:_session];
}

- (void)advertiseSelf:(BOOL)shouldAdvertise
{
  if (shouldAdvertise)
  {
    _advertiser = [[MCAdvertiserAssistant alloc] initWithServiceType:@"chat-files" discoveryInfo:nil session:_session];
    
    [_advertiser start];
  } else
  {
    [_advertiser stop];
    _advertiser = nil;
  }
}

//state가 바뀌었을 때, 진행되되는 메서드
- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state
{
  NSDictionary *dict = @{
                        @"peerID":peerID,
                        @"state":[NSNumber numberWithInt:state]
                        };
  
  [[NSNotificationCenter defaultCenter] postNotificationName:@"MCDidChangeStateNotification" object:nil userInfo:dict];
  
}

- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID
{
  NSDictionary *dict = @{
                         @"data": data,
                         @"peerID": peerID
                         };
  
  [[NSNotificationCenter defaultCenter] postNotificationName:@"MCDidReceiveDataNotification" object:nil userInfo:dict];
  
}

- (void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress
{
  
}

- (void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error
{
  
}

- (void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID
{
  
}







@end






