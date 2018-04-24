//
//  ViewController.m
//  WeatherApp
//
//  Created by Samuel K on 2018. 4. 18..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"
#import "NetworkModel.h"
#import "MyJSONM.h"
#import <Realm.h>

/*
 Realm 을 통하여, 실시간으로 Data를 업데이트 한다.
 1. 위도 경도를 업데이트 하면, 뷰에 새로운 데이터를 보여준다.
 */

/*
 1. 위도 경도를 업데이트 하면, 뷰에 새로운 데이터를 보여준다.
 1) 위도 경로 랜덤하게 설정 - 임의로 버튼을 만들어줌 (3개)
 2) 위도 경로에 따라 네트워크를 실행 (서울, 도쿄, 베이징)
 3) 시티 이름과 온도가 나오게 설정함.
 4) 데이터를 업데이트 시켜줌
 */

@interface WeatherRealm : RLMObject

//프로퍼티 설정
@property NSInteger id;
@property NSString *cityName;
@property NSNumber<RLMDouble> *temprature;

@end

@implementation WeatherRealm
+ (NSString *)primaryKey
{
  return @"id";
}
@end



@interface ViewController ()
{
  MyJSONM *myJson;
  NetworkModel *seoulWeatherData;

}

@property (nonatomic, strong) RLMResults *array;
@property (nonatomic, strong) RLMNotificationToken *notification;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSLog(@"viewDidLoad!!");
  
  seoulWeatherData = [[NetworkModel alloc] init]; // 초기화
  //seoulWeatherData.dataLoadingFromWeb 해도 동작을 같으나, 데이터를 사용하지 않기 때문에 에러 마크가 뜬다.
  //그렇기 때문에 [ ]으로 실행해줘서 불필요한 경고를 줄인다.
  [seoulWeatherData dataLoadingFromWeblatitude:[NSNumber numberWithDouble:37.56826]  logitude:[NSNumber numberWithDouble:126.977829]];

  //__weak typeof(self) weakSelf = self;
  
//  self.notification = [self.array addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
//    //최신으로 UI를 업데이트 해준다.
//    //배열 형식이 아닌 데이터 실시간 업데이트 형식이므로 사용할 필요가 없음..
//
//
//  }];
  
  //notification 기본적인 data Model 이 바뀌었을때, UI가 바뀌게 해준다.
  self.notification = [RLMRealm.defaultRealm addNotificationBlock:^(RLMNotification  _Nonnull notification, RLMRealm * _Nonnull realm) {
    
    
  }];
  
  
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:YES];
  
  NSLog(@"viewDidAppear!!");
  //View들이 구성되고 나서 UI를 넣어줌
  [[NSNotificationCenter defaultCenter] addObserver:self   selector:@selector(printJSONtoDictionaryNotification:) name:@"noti1" object:nil];
  
}

//Data를 저장하는 곳
//JSON Model 클래스가 생성되면
-(void)printJSONtoDictionaryNotification:(NSNotification *)notification
{
  
  //현재 JSON MODEL 제대로 사용 못하고 있음
  //초기화 하는 방법 중 하나로, 메서드를 설정하고, 그 메서드를 실행 후, 사용 하고 있음.
  //JSON 모델에 대해서 다시한번 확인 및 적용 할 것.
  myJson = [seoulWeatherData myDataModel];
  NSLog(@"데이터 확인 : %@", myJson.name);
  
  WeatherRealm *basicData = [[WeatherRealm alloc] init];
  basicData.cityName = myJson.name;
  basicData.temprature = [NSNumber numberWithDouble:myJson.main.temp];
  basicData.id = 1;
  
  RLMRealm *realm = [RLMRealm defaultRealm];
  [realm beginWriteTransaction];
  [realm addOrUpdateObject:basicData];
  [realm commitWriteTransaction];
  
  [self updateUI:basicData];
  
}

-(void)updateUI:(WeatherRealm*)basic {
  
  self.city.text = basic.cityName;
  self.temperature.text = [NSString stringWithFormat:@"%1@", basic.temprature];
  
}

-(void)realmSetupUI {
  
  //WeatherRealm *wData = self.array[0];
  
  WeatherRealm *sample = [[WeatherRealm alloc] init];
  
  self.city.text = sample.cityName;
  self.temperature.text = [NSString stringWithFormat:@"%@", sample.temprature];
  
}

//-(void)deleteRealm {
//
//  RLMRealm *realm = [RLMRealm defaultRealm];
//  [realm beginWriteTransaction];
//  [realm deleteAllObjects];
//  [realm commitWriteTransaction];
//
//}


- (IBAction)selectCityAction:(id)sender {
  
  NSInteger theTag = ((UIButton*)sender).tag;
  
  switch (theTag) {
    case 0:
      NSLog(@"서울이 선택되었습니다.");
      [seoulWeatherData dataLoadingFromWeblatitude:[NSNumber numberWithDouble:37.56826]  logitude:[NSNumber numberWithDouble:126.977829]];
      break;
    case 1:
      NSLog(@"도쿄가 선택되었습니다.");
      [seoulWeatherData dataLoadingFromWeblatitude:[NSNumber numberWithDouble:35.6889377]  logitude:[NSNumber numberWithDouble:139.7071532]];
      break;
    case 2:
      NSLog(@"베이징이 선택되었습니다.");
      [seoulWeatherData dataLoadingFromWeblatitude:[NSNumber numberWithDouble:39.9124433]  logitude:[NSNumber numberWithDouble:116.3865629]];
      break;
    default:
      break;
  }
}
@end
