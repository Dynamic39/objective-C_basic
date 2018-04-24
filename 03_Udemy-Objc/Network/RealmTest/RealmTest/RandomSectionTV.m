//
//  RandomSectionTV.m
//  RealmTest
//
//  Created by Samuel K on 2018. 4. 23..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "RandomSectionTV.h"
#import "RandomSectionTVCell.h"
#import <Realm.h>


//Realm data를 쓸 클래스를 설정하여 준다.

@interface TableViewData : RLMObject

//섹션 데이터, 타이틀, 날짜를 입력한다.
@property NSString *title;
@property NSDate *date;
@property NSString *sectionTitle;

@end

@implementation TableViewData

@end


@interface RandomSectionTV ()

//필수 요서 설정
@property (nonatomic, strong) NSArray *sectionTitles; // 섹션 구분
@property (nonatomic, strong) NSMutableArray *objectsBySection; //섹션별 아이템
@property (nonatomic, strong) RLMNotificationToken *notification; // Realm 변화 노티

@end

@implementation RandomSectionTV

- (void)viewDidLoad {
    [super viewDidLoad];
  
  //[self deleteAllData];
  
  //섹션 명 설정
  self.sectionTitles = @[@"First", @"Second", @"Third"];
  
  [self setNotification];
  
}

-(void)setNotification {
  
  __weak typeof(self) weakSelf = self;
  self.notification = [RLMRealm.defaultRealm addNotificationBlock:^(RLMNotification  _Nonnull notification, RLMRealm * _Nonnull realm) {
    
    [weakSelf.tableView reloadData];
    
  }];
  
  self.objectsBySection = [NSMutableArray arrayWithCapacity:3];
  
  for (NSString *section in self.sectionTitles) {
    RLMResults *unsortedObjects = [TableViewData objectsWhere:@"sectionTitle == %@", section];
    RLMResults *sortedObejects = [unsortedObjects sortedResultsUsingKeyPath:@"date" ascending:YES];
    
    [self.objectsBySection addObject:sortedObejects];
  }
  [self.tableView reloadData];
  
  
  
}

-(void)deleteAllData {
  
  RLMRealm *realm = [RLMRealm defaultRealm];
  [realm beginWriteTransaction];
  [realm deleteAllObjects];
  [realm commitWriteTransaction];
  
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionTitles.count;
}

//섹션 명 설정
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
  return self.sectionTitles[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [self objectsInSection:section].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  RandomSectionTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RandomSectionTVCell"];
  
  //data를 가져온다.
  TableViewData *cellObject = [self objectsInSection:indexPath.section][indexPath.row];
  cell.randomString.text = cellObject.title;
  cell.randonDate.text = cellObject.date.description;
  
  
  
  return cell;
  
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
  if(editingStyle == UITableViewCellEditingStyleDelete) {
    RLMRealm *realm = RLMRealm.defaultRealm;
    [realm beginWriteTransaction];
    [realm deleteObject:[self objectsInSection:indexPath.section][indexPath.row]];
    [realm commitWriteTransaction];
  }
  
  
}



#pragma Action Method;

- (IBAction)addMultipleAction:(id)sender {
  
  //dispath_queue로 변환
  dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  
  //Background Thread
  dispatch_async(queue, ^{
    @autoreleasepool {
      //Realm data 사용
      RLMRealm *realm = [RLMRealm defaultRealm];
      [realm beginWriteTransaction];
      for (NSInteger index = 0; index < 5 ; index ++) {
        [TableViewData createInRealm:realm withValue:@{
                                                       @"title":[self randomTitle],
                                                       @"date":[NSDate date],
                                                       @"sectionTitle":[self randomSectionTitle]
                                                       }];
      }
      [realm commitWriteTransaction];
    }
  });
  
  NSLog(@"Mulit Button Selected");
  
  
}

- (IBAction)addOneAction:(id)sender {
  
  //새로운 객체를 추가한다.
  [[RLMRealm defaultRealm] transactionWithBlock:^{
    [TableViewData createInDefaultRealmWithValue:@[[self randomTitle], [NSDate date], [self randomSectionTitle]]];
  }];
  
  NSLog(@"Button Selected");
  
}



#pragma - Helpers
//각 타이틀을 반환하도록 한다.
-(RLMResults *)objectsInSection:(NSInteger)section
{
  return self.objectsBySection[section];
}


-(NSString *)randomTitle
{
  return [NSString stringWithFormat:@"Title %d", arc4random()];
}

-(NSString *)randomSectionTitle
{
  //카운트 내의 섹션 타이틀을 읽어서 반환하여 준다.
  return self.sectionTitles[arc4random() % self.sectionTitles.count];
}


@end
