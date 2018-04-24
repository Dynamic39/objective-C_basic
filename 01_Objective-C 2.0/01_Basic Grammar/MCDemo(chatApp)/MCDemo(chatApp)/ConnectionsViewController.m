//
//  ConnectionsViewController.m
//  MCDemo(chatApp)
//
//  Created by Samuel K on 2018. 4. 10..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ConnectionsViewController.h"
#import "AppDelegate.h"

@interface ConnectionsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UISwitch *swVisible;
@property (weak, nonatomic) IBOutlet UITableView *tblConnectedDevices;
@property (weak, nonatomic) IBOutlet UIButton *btnDisconnect;


-(IBAction)browseForDevice:(id)sender;
-(IBAction)toggleVisibility:(id)sender;
-(IBAction)disconnect:(id)sender;
-(void)peerDidChangeStateWithNotification:(NSNotification *)notification;

@property (strong, nonatomic) NSMutableArray *arrConnectedDevices;

//AppDelegate의 프로퍼티를 설정하여 준다.
@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation ConnectionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  //sharedApplication 를 사용하기 위하여 앱딜리게이트 프로퍼티를 인스턴스화 시킨다.
  _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  [[_appDelegate mcManager] setupPeerAndSessionWithDisplayName:[UIDevice currentDevice].name];
  [[_appDelegate mcManager] advertiseSelf:_swVisible.isOn];
  
  
  //textField Delegate를 구현한다.
  //delegate 처리
  [_txtName setDelegate:self];
  
  //NSNotification을 받는다.
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(peerDidChangeStateWithNotification:) name:@"MCDidChangeStateNotification" object:nil];
  
  _arrConnectedDevices = [[NSMutableArray alloc] init];
  [_tblConnectedDevices setDelegate:self];
  [_tblConnectedDevices setDataSource:self];
  
}


#pragma mark - Action Methods

- (void)toggleVisibility:(id)sender
{
  [_appDelegate.mcManager advertiseSelf:_swVisible.isOn];
}

- (void)disconnect:(id)sender
{
  [_appDelegate.mcManager.session disconnect];
  
  _txtName.enabled = YES;
  
  [_arrConnectedDevices removeAllObjects];
  [_tblConnectedDevices reloadData];
}



#pragma mark - Notification Management

- (void)peerDidChangeStateWithNotification:(NSNotification *)notification
{
  MCPeerID *peerID = [[notification userInfo] objectForKey:@"peerID"];
  NSString *peerDisplayName = peerID.displayName;
  MCSessionState state = [[[notification userInfo] objectForKey:@"state"] intValue];
  
  if (state != MCSessionStateConnecting)
  {
    if (state == MCSessionStateConnected)
    {
      [_arrConnectedDevices addObject:peerDisplayName];
    } else if (state == MCSessionStateNotConnected)
    {
      if ([_arrConnectedDevices count] > 0)
      {
        int indexOfpeer = [_arrConnectedDevices indexOfObject:peerDisplayName];
        [_arrConnectedDevices removeObjectAtIndex:indexOfpeer];
      }
    }
    
    
    [_tblConnectedDevices reloadData];
    
    BOOL peersExist = ([[_appDelegate.mcManager.session connectedPeers] count] == 0);
    [_btnDisconnect setEnabled:!peersExist];
    [_txtName setEnabled:peersExist];
    
  }
}

#pragma mark - TableView delegate method

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [_arrConnectedDevices count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  if (cell == nil)
  {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
  }
  
  cell.textLabel.text = [_arrConnectedDevices objectAtIndex:indexPath.row];
  return cell;
  
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 60.0;
}



# pragma mark - MCBrowser Delegate Methods
- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController
{
  [_appDelegate.mcManager.browser dismissViewControllerAnimated:YES completion:nil];
}

- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController
{
  [_appDelegate.mcManager.browser dismissViewControllerAnimated:YES completion:nil];
}



- (void)browseForDevice:(id)sender
{
  
  //mcManager클래스의 메서드를 사용하여 브라우저를 세팅한다.
  [[_appDelegate mcManager] setupMCBrowser];
  //browser의 delegate를 설정한다.
  [[[_appDelegate mcManager] browser] setDelegate:self];
  [self presentViewController:[[_appDelegate mcManager] browser] animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
  _appDelegate.mcManager.peerID = nil;
  _appDelegate.mcManager.session = nil;
  _appDelegate.mcManager.browser = nil;
  
  if ([_swVisible isOn])
  {
    [_appDelegate.mcManager.advertiser stop];
  }
  _appDelegate.mcManager.advertiser = nil;
  
  [_appDelegate.mcManager setupPeerAndSessionWithDisplayName:_txtName.text];
  [_appDelegate.mcManager setupMCBrowser];
  [_appDelegate.mcManager advertiseSelf:_swVisible.isOn];
  
  return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
