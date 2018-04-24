//
//  MyJSONM.h
//  WeatherApp
//
//  Created by Samuel K on 2018. 4. 18..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>
#import <Realm.h>


//(Sub)Main Model
@interface MainModel: JSONModel

@property (nonatomic) double humidity;
@property (nonatomic) double pressure;
@property (nonatomic) double temp;

@end

//(Sub)weather Model
@protocol WeatherModel;

@interface WeatherModel: JSONModel

@property (nonatomic) NSInteger id;
//@property (nonatomic) NSString *description;
@property (nonatomic) NSString *icon;
@property (nonatomic) NSString *main;

@end

//(Sub)windModel Model
@interface WindModel: JSONModel

@property (nonatomic) double deg;
@property (nonatomic) double speed;

@end

// - MAIN -
@interface MyJSONM : JSONModel

@property (nonatomic) NSInteger id;
@property (nonatomic) NSString *name;
@property (nonatomic) MainModel *main;
@property (nonatomic) NSArray <WeatherModel> *weather;
@property (nonatomic) WindModel *wind;

@end
