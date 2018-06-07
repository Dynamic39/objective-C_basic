//
//  RandomTV.m
//  RealmTest
//
//  Created by Samuel K on 2018. 4. 23..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "RandomTV.h"
#import "TableDB.h"


/*
 1. Realm DataModel을 활용한 TableView를 만들어보자.
 2. Random으로 String / date모델을 가지고 온다.
 3. Realm 에 data input 및 정렬기능을 추가 하여 진행한다.
 4. Background Thread를 활용하여 진한다.
 */



@interface RandomTV ()

@property RLMResults *array;
//새로고침 할 notification
@property RLMNotificationToken *notification;
@property GroupParent *parent;

@property (nonatomic, strong) TableDB *sampleObject;

@end

@implementation RandomTV

- (void)viewDidLoad {
    [super viewDidLoad];
  
  
  self.parent = [GroupParent new];
  
  //array 설정 - 날짜기준으로 정렬됨
  self.array = [[TableDB allObjects] sortedResultsUsingKeyPath:@"date" ascending:YES];
  
  //notification을 설정하여 data를 새로고침하여 준다.
  //self 가 순환참조의 위험이 있으므로, weak 타입을 사용하여 준다.
  
  __weak typeof(self) weakSelf = self;
  
  self.notification = [self.array addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
    
    [weakSelf.tableView reloadData];
    
  }];
  
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
  
  //RLMObject를 indexPath로 초기화 하여 준다.
  TableDB *object = self.array[indexPath.row];
  
  cell.textLabel.text = object.titleName;
  cell.detailTextLabel.text = object.date.description;
  
  return cell;
  
}

//삭제 메서드 구현
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm deleteObject:self.array[indexPath.row]];
    [realm commitWriteTransaction];
  }
}



//랜덤으로 스트링과 날짜를 생성되는 메서드를 구현한다.

-(NSString *)randomString {
  return [NSString stringWithFormat:@"임의 생성 문자 (%u) + %@", arc4random()];
}

-(NSDate *)randomDate {
  return [NSDate dateWithTimeIntervalSince1970:arc4random()];
}



- (IBAction)backgroundAddAction:(id)sender {
  
  [self backgroundAction];
  
}

-(void)backgroundAction
{
  //dispatch_queue 를 사용하여 데이터를 백그라운드 스레드에서 진행하여 준다.
  dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  //비동기 처리 진행
  dispatch_async(backgroundQueue, ^{
    //ARC를 위하여 Autorelease 지정후 진행
    @autoreleasepool {
      //real 작성 시작
      RLMRealm *realm = [RLMRealm defaultRealm];
      [realm beginWriteTransaction];
      //5개의 랜덤한 Cell을 만들어 보자.
      for (NSInteger i = 0; i < 5; i++) {
        [TableDB createInRealm:realm withValue:@{
                                                 @"titleName":[self randomString],
                                                 @"date":[self randomDate]
                                                 }];
      
      //Realm Array를 만들어 준다.
        
//      [self.parent.groups addObject: [Group createInRealm:realm withValue:@{
//                                                                            @"name":[NSString stringWithFormat:@"Section = %i", arc4random()],
//                                                                            @"entries":@{@"title":[self randomString],
//                                                                                         @"date":[self randomDate]
//                                                                                         }
//                                                                            }]];
      
      
      
      
      
      }
        [realm commitWriteTransaction];
    }
  });
}
                 
                


- (IBAction)oneAddAction:(id)sender {
  
  [self addOne];
  
}


-(void)addOne
{
  
  //Realm Data를 이용하여 새로운 객체를 추가하고 업데이트 한다.
  RLMRealm *realm = [RLMRealm defaultRealm];
  [realm beginWriteTransaction]; // data model 입력 시작 전 명령어
  [TableDB createInRealm:realm withValue:@{
                                          @"titleName":[self randomString],
                                          @"date":[self randomDate]
                                          }]; // realm 모델에 data 넣어주기, 기본적으로 array형태로 들어간다.
  [realm commitWriteTransaction]; // commit 실행하여 데이터 넣기 종료
  
}



@end
