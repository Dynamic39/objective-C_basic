//
//  DetailVC.h
//  LondonLM
//
//  Created by Samuel K on 2018. 4. 18..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface DetailVC : UIViewController

//detailView에서 받을 data를 설정한다.
@property (strong, nonatomic) NSArray *detailModal;

//detailView에 표시할 데이터를 설정한다.
@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;
@property (weak, nonatomic) IBOutlet UILabel *detailTitle;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLB;
@property (weak, nonatomic) IBOutlet UITextView *detailTextview;
@property (weak, nonatomic) IBOutlet UIButton *detailButton;
@property (weak, nonatomic) IBOutlet MKMapView *detailMapview;


- (IBAction)directions:(id)sender;

@end
