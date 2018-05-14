//
//  MainListVC.m
//  MemoryApp
//
//  Created by Samuel K on 2018. 4. 24..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "MainListVC.h"

#import <Realm.h>

@interface MemoRealm : RLMObject

@property NSString *title;
@property NSString *contents;
@property NSData *convetedImage;
@property NSDate *regDate;

@end

@implementation MemoRealm
@end

@interface MainListVC ()

@property RLMResults *array;
@property RLMNotificationToken *notification;
@property MemoData *dataTaken;

@end



@implementation MainListVC
@synthesize datapass;
//@synthesize memo;

- (void)viewDidLoad {
    [super viewDidLoad];
  
  self.array = [[MemoRealm allObjects] sortedResultsUsingKeyPath:@"regDate" ascending:YES];
  
  [self sideBarbutton];
  
  
  
  __weak typeof(self) weakSelf = self;
  
  self.notification = [self.array addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
    
    [weakSelf.tableView reloadData];
    
  }];
  
}

-(void)sideBarbutton {
  
  SWRevealViewController *revealVC = self.revealViewController;
  
  if (revealVC) {
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] init];
    btn.image = [UIImage imageNamed:@"sidemenu"];
    btn.target = revealVC;
    btn.action = @selector(revealToggle:);
    
    self.navigationItem.leftBarButtonItem = btn;
    [self.view addGestureRecognizer:revealVC.panGestureRecognizer];
  }
  
  
  
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  
  //Delegate pattern을 사용하기 위해서 서로간의 ViewController 간 연결이 되어 있어야 한다.
  if ([segue.identifier isEqualToString:@"memoSegue"])
  {
    MemoFormVC *memo = [segue destinationViewController];
    memo.delegate = self;
  }
  
  
}

- (void)dataHandler:(MemoData *)MemoDataModel
{
  
  if (MemoDataModel.title != nil) {
    
    self.dataTaken = MemoDataModel;
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [MemoRealm createInRealm:realm withValue:@{@"title":self.dataTaken.title,
                                               @"contents":self.dataTaken.contents,
                                               @"regDate":self.dataTaken.regDate
                                               }];
    [realm commitWriteTransaction];
    
  }
  
  
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  MemoReadVC *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MemoRead"];
  
  MemoRealm *object = self.array[indexPath.row];
  detailVC.detailtextString = object.title;
  NSLog(@"오브젝트 : %@", object.title);
  NSLog(@"디테일 VC : %@", detailVC.detailtextString);
  detailVC.textviewString = object.contents;
  
  
  [self.navigationController pushViewController:detailVC animated:YES];
  
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
    return self.array.count;
  
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    RLMRealm *realm = RLMRealm.defaultRealm;
    [realm beginWriteTransaction];
    [realm deleteObject:self.array[indexPath.row]];
    [realm commitWriteTransaction];
  }
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  MemoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  MemoRealm *object = self.array[indexPath.row];
  
  cell.titleLB.text = object.title;
  cell.contentsLB.text = object.contents;
  cell.dateLB.text = object.regDate.description;
  
  return cell;
  
}



- (IBAction)testSample:(id)sender {
  
  
  
}
@end
