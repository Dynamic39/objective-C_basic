//
//  MapPin.h
//  MapKitApp
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapPin : NSObject <MKAnnotation>
{
  
  CLLocationCoordinate2D coordinate;
  
}

@property (assign, nonatomic) CLLocationCoordinate2D coordinate;

@end
