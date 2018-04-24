//
//  ViewController.h
//  WeatherApp
//
//  Created by Samuel K on 2018. 4. 18..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UILabel *temperature;


- (IBAction)selectCityAction:(id)sender;


@end

