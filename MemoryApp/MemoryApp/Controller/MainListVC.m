//
//  MainListVC.m
//  MemoryApp
//
//  Created by Samuel K on 2018. 4. 24..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "MainListVC.h"
#import "MEMO_TB.h"

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
    
    self.array = [[MEMO_TB allObjects] sortedResultsUsingKeyPath:@"REG_DATE" ascending:YES];
    
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
        [MEMO_TB createInRealm:realm withValue:@{@"TITLE_TXT":self.dataTaken.title,
                                                 @"CONTENTS":self.dataTaken.contents,
                                                 @"REG_DATE":self.dataTaken.regDate,
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
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MemoReadVC *detailVC = [storyboard instantiateViewControllerWithIdentifier:@"MemoRead"];
    
    MEMO_TB *object = self.array[indexPath.row];
    
    detailVC.detailtextString = object.TITLE_TXT;
    NSLog(@"detail VC,    %@,    %@", detailVC.detailtextString, object.TITLE_TXT);
    detailVC.textviewString = object.CONTENTS;
    
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
    MEMO_TB *object = self.array[indexPath.row];
    
    cell.titleLB.text = object.TITLE_TXT;
    cell.contentsLB.text = object.CONTENTS;
    cell.dateLB.text = object.REG_DATE.description;
    
    return cell;
    
}



- (IBAction)testSample:(id)sender {
    
    
    
}
@end

