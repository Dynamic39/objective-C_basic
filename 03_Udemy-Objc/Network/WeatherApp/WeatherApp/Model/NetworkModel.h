//
//  NetworkModel.h
//  WeatherApp
//
//  Created by Samuel K on 2018. 4. 18..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "MyJSONM.h"

@interface NetworkModel : NSObject

-(void)dataLoadingFromWeblatitude:(NSNumber*)lati logitude:(NSNumber*)longi;


@property (nonatomic, strong) NSString *networkSampleString;
@property (nonatomic, strong) MyJSONM *myDataModel;

@end
