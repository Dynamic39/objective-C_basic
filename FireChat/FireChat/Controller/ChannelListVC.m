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
@property (nonatomic, strong) NSMutableArray <Channel *> *channels;

//Firebase Data reference
@property (strong, nonatomic) FIRDatabaseReference *channelRef;


@end

@implementation ChannelListVC

- (void)viewDidLoad {
    [super viewDidLoad];
  self.navigationController.navigationBar.hidden = NO;
  
  self.channelRef = [[FIRDatabase database] reference];
  [FIRDatabase.database.reference child:@"channels"];
  self.channels = [NSMutableArray new]; // 초기화를 꼭..해줘야함.. ㅠ
  [self observeChnnels];
  
  
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:YES];
  
  
  
  

}

#pragma mark - helper Method



-(void)observeChnnels {
  
  [self.channelRef observeEventType:FIRDataEventTypeChildAdded withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
    
    NSDictionary *channelData = snapshot.value;
    NSLog(@"%@", snapshot.value);
    NSString *id = snapshot.key;
    NSString *name = channelData[@"name"];
    
    if (name != nil) {
      
      Channel *firCh = [[Channel alloc] init];
      firCh.ID = id;
      firCh.name = name;
      [self.channels addObject:firCh];
      [self.tableView reloadData];
    } else {
      NSLog(@"ERROR FOR FIREBASE DATA");
      
    }
  }];
  
  
  
}

#pragma Helper

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  
  if ([segue.identifier isEqualToString:@"showChannel"])
  {
    ChatVC *chatVC = [segue destinationViewController];
    
    
  }
  
}


#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  if (indexPath.section == 1) {
    
    Channel *channel = self.channels[indexPath.row];
    
    ChatVC *chatvc = [self.storyboard instantiateViewControllerWithIdentifier:@"ChatVC"];
    //chatvc.senderDiplayName =
    chatvc.channel = channel;
    chatvc.channelRef = [self.channelRef child:channel.ID];
    
    //[self performSegueWithIdentifier:@"ShowChannel" sender:channel];
    [self.navigationController pushViewController:chatvc animated:YES];
  }
}

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
