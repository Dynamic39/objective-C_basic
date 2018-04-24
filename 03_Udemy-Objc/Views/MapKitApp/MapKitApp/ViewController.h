//
//  ViewController.h
//  MapKitApp
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapKit;

- (IBAction)standard:(id)sender;
- (IBAction)Satlilte:(id)sender;
- (IBAction)hybrid:(id)sender;
- (IBAction)locate:(id)sender;


- (IBAction)directions:(id)sender;


@end

