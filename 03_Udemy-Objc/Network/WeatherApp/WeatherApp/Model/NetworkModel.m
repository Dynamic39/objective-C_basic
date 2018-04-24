//
//  NetworkModel.m
//  WeatherApp
//
//  Created by Samuel K on 2018. 4. 18..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "NetworkModel.h"
#import "MyJSONM.h"
#import "ViewController.h"

@implementation NetworkModel

- (void)dataLoadingFromWeblatitude:(NSNumber*)lati logitude:(NSNumber*)longi
{
  //질문!
  NSDictionary *parameters = @{@"lat":lati, @"lon":longi,
                               @"APPID":@"b833dd8430700d288b31b46d14e3e28f"
                               };
  //매니저 호출
  AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
  manager.responseSerializer = [AFJSONResponseSerializer serializer];
  
  NSString *url = @"http://api.openweathermap.org/data/2.5/weather";
  //리퀘스트를 날릴 준비를 한다.
  [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
    NSLog(@"데이터 다운로드 성공!");
    
    //noti 송출부
    NSDictionary *userInfo = responseObject;
    self.networkSampleString = @"스트링을 불러 올 수 있는지 테스트 합니다.";
    NSError *jsonErr;
    self.myDataModel = [[MyJSONM alloc] initWithDictionary:userInfo error:&jsonErr];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"noti1" object:nil userInfo:userInfo];
    
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    
    NSLog(@"%@", error);
    NSLog(@"Data download를 실패하였습니다. 주소, 파라미터값을 다시 확인하여 주세요.");
    
  }];
  

}

@end
