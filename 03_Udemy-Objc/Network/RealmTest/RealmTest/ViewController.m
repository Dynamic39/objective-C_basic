//
//  ViewController.m
//  RealmTest
//
//  Created by Samuel K on 2018. 4. 19..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"
#import <Realm.h>

// Define your models
@interface Dog : RLMObject
//Realm object 설정
@property NSString *name;
@property NSInteger age;
@end

@implementation Dog
// No need for implementation
@end

//array type으로 설정하기 위해 작업 진행.
RLM_ARRAY_TYPE(Dog)

@interface Person : RLMObject
@property NSString *name;
@property NSInteger age;
@property RLMArray<Dog> *dogs;

@end

@implementation Person
@end

//@interface Book: RLMObject
//
//@property NSInteger id;
//@property NSString *title;
//@property float price;
//
//@end
//
//@implementation Book

//기본키 설정
//+ (NSString *)primaryKey
//{
//  return @"id";
//}

//@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  //새로운 객체 생성
  Dog *myDog = [[Dog alloc] init];
  myDog.name = @"Rex";
  myDog.age = 10;
  
  //딕셔너리 타입으로 초기화
  Dog *myOthreDog = [[Dog alloc] initWithValue:@{@"name": @"Pluto", @"age":@3}];
  
  //배열 타입으로 초기화
  Dog *myThirdDog = [[Dog alloc] initWithValue:@[@"Pluto",@3]]; // 순서를 잘 맞춰야함.
  
  //배열의 경우 딕셔너리 혹은 중첩 배열로 설정할 수 있다.
  Person *person1 = [[Person alloc] initWithValue:@[@"Jane", @30, @[myDog, myOthreDog]]];
  
  Person *person2 = [[Person alloc] initWithValue:@[@"Sam", @33, @[@[@"Buster", @5], @[@"Buddy", @5]]]];
  
  //객체 추가
  Person *author = [[Person alloc] init];
  author.name = @"David Foster wallace";
  
  
  //Default Realm 만들기
  RLMRealm *realm = [RLMRealm defaultRealm];
  
  //Transaction 만들기
  [realm beginWriteTransaction];
  [realm addObject:author];
  [realm commitWriteTransaction];
  
  //Trancation Update
  [realm beginWriteTransaction];
  author.name = @"Thomas Pynchon";
  [realm commitWriteTransaction];
  
  
//  Book *cheeseBook = [[Book alloc] init];
//  cheeseBook.title = @"Cheese recipes";
//  cheeseBook.price = 9000;
  //cheeseBook.id = @1;
  
  //Updating book with id = 1
//  [realm beginWriteTransaction];
//  [realm addOrUpdateObject:cheeseBook];
//  [realm commitWriteTransaction];
  
  //Book을 새로 만들고, id 값이 1일 경우 그 값들도 복사한다.
//  [realm beginWriteTransaction];
//  [Book createOrUpdateInRealm:realm withValue:@{@"id":@1, @"price": @9000.0f}];
  //title 의 경우, 바뀌지 않음
  
  //KVC value
  //Person 에 해당하는 모든 오브젝트를 가지고 온다.
  RLMResults<Person *> *persons = [Person allObjects];
  [[RLMRealm defaultRealm] transactionWithBlock:^{
    [[persons firstObject] setValue:@YES forKey:@"isFirst"];
    //set each person's planet property to "Earth"
    [persons setValue:@"Earth" forKey:@"planet"];
  }];
  
//  [realm beginWriteTransaction];
//  [realm deleteObject:cheeseBook];
//  [realm commitWriteTransaction];
  
  //모든 객체 삭제
//  [realm beginWriteTransaction];
//  [realm deleteAllObjects];
//  [realm commitWriteTransaction];
  
  //쿼리 진행
  //색깔이 tan 이고, 이름이 B로 시작하는 황갈색의 dog를 검색할 수 있다.
  //RLMResults<Dog *> *tanDogs = [Dog objectsWhere:@"color = 'tan' AND name BEGINSWITH 'B'"];
  
  //NSpredicate 를 사용하여 쿼리
  NSPredicate *pred = [NSPredicate predicateWithFormat:@"color = %@ AND name BEGINSWITH %@", @"tan", @"B"];
  
  //tanDogs = [Dog objectsWithPredicate:pred];
  
  //정렬
  RLMResults<Dog *> *sortedDogs = [[Dog objectsWhere:@"color = 'tan' AND name BEGINSWITH 'B'"] sortedResultsUsingKeyPath:@"name" ascending:YES];
  
  //일대일 관계의 속성을 키 경로를 사용 할 수 있음
  RLMResults<Person *> *dogOwners = [Person allObjects]; // 전체 인스턴스 설정
  RLMResults<Person *> *ownersByDogAge = [dogOwners sortedResultsUsingKeyPath:@"dog.age" ascending:YES]; // 강아지의 나이 순으로 정리한다.
  
  
  //연쇄 검색
  RLMResults<Dog *> *tanDogs = [Dog objectsWhere:@"color = 'tan'"];
  RLMResults<Dog *> *tanDogsWithBNames = [tanDogs objectsWhere:@"name BEGINSWITH 'B'"];
  
  //Results 자동 업데이트
  RLMResults<Dog *> *puppies = [Dog objectsInRealm:realm where:@"age < 2"];
  puppies.count;
  
  [realm transactionWithBlock:^{
    [Dog createInRealm:realm withValue:@{@"name":@"Fido", @"age":@1}];
  }];
  
  puppies.count;
  
  
  
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}



@end
