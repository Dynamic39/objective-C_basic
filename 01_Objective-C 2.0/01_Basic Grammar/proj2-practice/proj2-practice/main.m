//
//  main.m
//  proj2-practice
//
//  Created by Samuel K on 2018. 4. 6..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>

/*자동차 예제를 기반으로 해서 매일 사용하는 객체를 하나 만들고 하는일 다섯가지를 적어보자*/

//자동차 클래스
@interface Car: NSObject
//자동차 이름
-(void)setCarName:(NSString*)name;
//자동차 최고속도
-(void)maximunSpeed:(int)maxSpeed;
//미션 단수
-(void)missionLevel:(int)mission;
//엔진 배기음
-(void)soundOfMahura:(int)soundLevel;
//바퀴수
-(void)tireCounter:(int)tires;
//자동차 표시
-(void)specificationOfMyCar;

@end

//자동차 실행부
@implementation Car
//맴버 변수
{
  NSString *carName;
  int maximunSpeed;
  int missionLevel;
  int soundOfMahura;
  int tireCounter;
}

-(void)setCarName:(NSString *)name
{
  carName = name;
}

-(void)maximunSpeed:(int)maxSpeed
{
  maximunSpeed = maxSpeed;
}

-(void)missionLevel:(int)mission
{
  missionLevel = mission;
}

-(void)soundOfMahura:(int)soundLevel
{
  soundOfMahura = soundLevel;
}

-(void)tireCounter:(int)tires
{
  tireCounter = tires;
}

-(void)specificationOfMyCar
{
  NSLog(@"My Car name is %@, Maximun speed is %iKm,\n mission is %i level and It have %i tires", carName, maximunSpeed, missionLevel, tireCounter);
}

@end

//실행 부분
int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
    Car *myFirstCar = [Car new];
    
    [myFirstCar setCarName:@"KIA K3"];
    [myFirstCar maximunSpeed:150];
    [myFirstCar missionLevel:6];
    [myFirstCar soundOfMahura:70];
    [myFirstCar tireCounter:4];
    [myFirstCar specificationOfMyCar];
    
    
  }
  return 0;
}
