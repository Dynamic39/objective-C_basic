//
//  RealmTV.m
//  RealmTest
//
//  Created by Samuel K on 2018. 4. 20..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "RealmTV.h"
#import <Realm.h>

//Realm model object
@interface DemoObject : RLMObject

//Realm으로 관리한 프로퍼티 설정
@property NSString *title;
@property NSDate *date;

@end
@implementation DemoObject

@end

//글로벌 상수 진행
static NSString * const kCellID = @"cell";
static NSString * const kTableName = @"table";

@interface RealmTV ()

//Realm Array 및 Realm notification 진행
@property (nonatomic, strong) RLMResults *array; // Realm으로 관리할 배열 설정
@property (nonatomic, strong) RLMNotificationToken *notification; // 노티가 확인 되었을때 업데이트 되되는 토큰 설정

@end

@implementation RealmTV

- (void)viewDidLoad {
    [super viewDidLoad];
  
  
  //array 설정
  self.array = [[DemoObject allObjects] sortedResultsUsingKeyPath:@"date" ascending:YES];
  [self setupUI];

  
  //Set realm notification block
  __weak typeof(self) weakSelf = self; // weak self 진행
  
  self.notification = [self.array addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
    
    if (error) {
      NSLog(@"Failed to open Realm on background worker: %@", error);
      return;
    }
    
    UITableView *tv = weakSelf.tableView;
    //자료가 변경될때 마다 리로드 되게 한다.
    if (!change) {
      [tv reloadData];
      return;
    }
    
    [tv beginUpdates];
    [tv deleteRowsAtIndexPaths:[change deletionsInSection:0] withRowAnimation:UITableViewRowAnimationAutomatic];
    [tv insertRowsAtIndexPaths:[change insertionsInSection:0] withRowAnimation:UITableViewRowAnimationAutomatic];
    [tv reloadRowsAtIndexPaths:[change modificationsInSection:0] withRowAnimation:UITableViewRowAnimationAutomatic];
    [tv endUpdates];
    
    NSLog(@"Data가 새로 업데이트 되었습니다.");
    
  }];
  
  
  
}

//UI update
-(void)setupUI {
  
  self.title = @"TableViewExample";
  self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"BG Add" style:UIBarButtonItemStylePlain target:self action:@selector(backgroundAdd)];
  
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
  
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellID];
  }
  
  //Realm의 Array 와 클래스를 설정한다.
  DemoObject *object = self.array[indexPath.row];
  cell.textLabel.text = object.title;
  cell.detailTextLabel.text = object.date.description;
  
  return cell;
}


//Editing Style 지정
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
  
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    
    //Data 삭제
    //Realm 설정
    RLMRealm *realm = [RLMRealm defaultRealm];
    //Realm data 삭제
    [realm beginWriteTransaction];
    [realm deleteObject:self.array[indexPath.row]];
    [realm commitWriteTransaction];
    
  }
  
}


-(void)backgroundAdd {
  
  //다른 스레드에서 돌림
  dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  dispatch_async(queue, ^{
    @autoreleasepool {
      RLMRealm *realm = [RLMRealm defaultRealm];
      [realm beginWriteTransaction];
      for (NSInteger index = 0; index < 5; index ++) {
        //ADD ROW DICTIONARY 를 넣기
        [DemoObject createInRealm:realm withValue:@{@"title" : [self randomString], @"date":[self randomDate]}];
      }
      [realm commitWriteTransaction];
    }
  });
  
}

-(void)add {
  
  RLMRealm *realm = [RLMRealm defaultRealm];
  [realm beginWriteTransaction];
  [DemoObject createInRealm:realm withValue:@[[self randomString], [self randomDate]]];
  [realm commitWriteTransaction];
  
//  [realm beginWriteTransaction];
//  for (DemoObject *titleObjects in [DemoObject objectsInRealm:realm where:@"title BEGINSWITH 'MAIN'"]) {
//    NSString *textRecovery = [NSString stringWithFormat:@"Title %d", arc4random()];
//    titleObjects.title = textRecovery;
//  }
//  [realm commitWriteTransaction];
  
  
  
}

- (NSString *)randomString {
  return [NSString stringWithFormat:@"Title %d", arc4random()];
}

- (NSDate *)randomDate {
  return [NSDate dateWithTimeIntervalSince1970:arc4random()];
}






@end
