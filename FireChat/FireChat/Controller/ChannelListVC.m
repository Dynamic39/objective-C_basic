//
//  ChannelListVC.m
//  FireChat
//
//  Created by Samuel K on 2018. 4. 26..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ChannelListVC.h"
@import Firebase;

enum Section {
  createNewChannelSection = 0,
  currentChannelsSection
}Section;

static NSString *cellIdentifier0 = @"NewChannel";
static NSString *cellIdentifier1 = @"ExistingChannel";

@interface ChannelListVC ()

- (IBAction)refresh:(id)sender;


@property (nonatomic, strong) NSString *senderDisplayName;
@property (nonatomic, strong) NSString *textfieldString;
@property (nonatomic, strong) NSArray <Channel *> *channels;

//Firebase Data reference
@property (strong, nonatomic) FIRDatabaseReference *channelRef;


@end

@implementation ChannelListVC

- (void)viewDidLoad {
    [super viewDidLoad];
  self.navigationController.navigationBar.hidden = NO;
  
  
  [self observeChnnels];


  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:YES];
  
  self.channelRef = [[FIRDatabase database] reference];
  

}

#pragma mark - helper Method



-(void)observeChnnels {
  
  NSString *userID = [FIRAuth auth].currentUser.uid;
  [[[_channelRef child:@"users"] child:userID] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
    
    NSDictionary *channelData = snapshot.value;
    NSString *id = snapshot.key;
    
    NSString *name = channelData[@"name"];
    if (name != nil) {
     
      Channel *chatRood = [Channel new];
      chatRood.ID = id;
      chatRood.name = name;
      
      [self.tableView reloadData];
      
    }
  }];
  
  
  
  
  
}


#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

  if (section == 0) {
    return 1;
    
  } else if (section == 1) {
    
    return self.channels.count;
    
  } else {
    return 0;
  }
  
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  if (indexPath.section == 0) {
    ChatCell *chatCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier0 forIndexPath:indexPath];
    
    self.textfieldString = chatCell.chatTitleTF.text;
    return chatCell;
    
  } else if (indexPath.section == 1) {
    
    ChatListCell *listCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier1 forIndexPath:indexPath];
    listCell.addedChatLabel.text = self.channels[indexPath.row].name;
    return listCell;
    
  } else {
    UITableViewCell *cell = [UITableViewCell new];
    return cell;
  }
}

- (IBAction)refresh:(id)sender {
  
  [self.tableView reloadData];
  
}
@end
