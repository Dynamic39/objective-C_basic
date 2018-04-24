//
//  ViewController.m
//  MapKitApp
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"
#import "MapPin.h" // mapPin 임포트

@interface ViewController ()
{
  //CLLocation settings
  CLLocationManager *locationManager;
}

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self standardAnnotation];
  
  //delegate 준수 설정
  locationManager.delegate = self;
  self.mapKit.delegate = self;
  locationManager = [[CLLocationManager alloc] init];
 
}

- (void)standardAnnotation {
  
  
  
//  MapPin *ann = [[MapPin alloc] init];
//  ann.coordinate = location;
//  [self.mapKit addAnnotation:ann];
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


- (IBAction)standard:(id)sender {
  
  self.mapKit.mapType = MKMapTypeStandard;
  
}

- (IBAction)Satlilte:(id)sender {
  
  self.mapKit.mapType = MKMapTypeSatellite;

}

- (IBAction)hybrid:(id)sender {
  
  self.mapKit.mapType = MKMapTypeHybrid;
  
}

- (IBAction)locate:(id)sender {
  
  //위치관련 인증 절차 시행
  [locationManager requestWhenInUseAuthorization];
  [locationManager requestAlwaysAuthorization];
  
  [locationManager startUpdatingLocation];
  
  //현재 유저의 위치를 보여줌
  self.mapKit.showsUserLocation = YES;
  
  
} 

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
  
  MKCoordinateRegion region;
  MKCoordinateSpan span;
  
  //lati longi delta값 넣기
  span.latitudeDelta = 0.005;
  span.longitudeDelta = 0.005;
  
  CLLocationCoordinate2D location;
  
  location.latitude = userLocation.coordinate.latitude;
  location.longitude = userLocation.coordinate.longitude;
  
  //region에 span값 및 center값을 넣어준다.
  region.span = span;
  region.center = location;
  [self.mapKit setRegion:region animated:YES];

}

//경로 검색
- (IBAction)directions:(id)sender {
  
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://maps.apple.com/maps?daddr=36.32061450000003,127.36617569999999"] options:@{} completionHandler:nil];
  
}
@end
