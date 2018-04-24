//
//  DetailVC.m
//  LondonLM
//
//  Created by Samuel K on 2018. 4. 18..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "DetailVC.h"
#import "MapPin.h"

@interface DetailVC ()
{
  
  double latitude;
  double longitude;
  
}

@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
  //전달받은 데이터를 기준으로 데이터를 입력한다.
  //원래는 클래스를 만들어야함.
  self.navigationItem.title = self.detailModal[0];
  self.detailTitle.text = self.detailModal[0];
  self.detailDescriptionLB.text = self.detailModal[1];
  self.detailImageView.image = [UIImage imageNamed:self.detailModal[2]];
  
  //layer 설정
  self.detailButton.layer.cornerRadius = 5;
  self.detailButton.clipsToBounds = YES;
  self.detailMapview.layer.cornerRadius = 5;
  self.detailMapview.clipsToBounds = YES;
  
  
  [self equalToDataModal];
  [self findLocation];
  
  
}

-(void)findLocation {
  
  //Map Setting 진행
  MKCoordinateRegion region;
  MKCoordinateSpan span;
  
  span.latitudeDelta = 0.005;
  span.longitudeDelta = 0.005;
  
  CLLocationCoordinate2D location;
  
  location.latitude = latitude;
  location.longitude = longitude;
  
  region.span = span;
  region.center = location;
  
  [self.detailMapview setRegion:region animated:YES];
  
  //Pin 설정
  MapPin *ann = [[MapPin alloc] init];
  ann.coordinate = location;
  
  [self.detailMapview addAnnotation:ann];
  
  
  
}

-(void)equalToDataModal {
  
  //Textfield 내용 넣기
  if ([self.detailTitle.text isEqualToString:@"Big Ben"]) {
    
    self.detailTextview.text = @"Big Ben is the nickname for the Great Bell of the clock at the north end of the Palace of Westminster in London and is usually extended to refer to both the clock and the clock tower as well.";
    
    latitude = 51.50072919999999;
    longitude = -0.12462540000001354;
    
    
  }
  
  if ([self.detailTitle.text isEqualToString:@"Buckingham Palace"]) {
    
    self.detailTextview.text = @"Buckingham Palace is the London residence and administrative headquarters of the reigning monarch of the United Kingdom. Located in the City of Westminster, the palace is often at the centre of state occasions and royal hospitality.";
    
    latitude = 51.501364;
    longitude = -0.1418899999999894;
    
  }
  
  if ([self.detailTitle.text isEqualToString:@"London Eye"]) {
    
    self.detailTextview.text = @"The London Eye is a giant Ferris wheel on the South Bank of the River Thames in London. Also known as the Millennium Wheel, it has also been called by its owners the British Airways London Eye.";
    
    latitude = 51.5009185;
    longitude = -0.11957469999993009;
    
    
  }
  
  if ([self.detailTitle.text isEqualToString:@"St Pauls Cathedral"]) {
    
    self.detailTextview.text = @"St Paul's Cathedral, London, is an Anglican cathedral, the seat of the Bishop of London and the mother church of the Diocese of London. It sits on Ludgate Hill at the highest point of the City of London and is a Grade 1 listed building.";
    
    latitude = 51.513191;
    longitude = -0.09759899999994559;
    
    
  }
  
  if ([self.detailTitle.text isEqualToString:@"Tower Bridge"]) {
    
    self.detailTextview.text = @"Tower Bridge is a combined bascule and suspension bridge in London built between 1886 and 1894. The bridge crosses the River Thames close to the Tower of London and has become an iconic symbol of London.";
    
    latitude = 51.5049885;
    longitude = -0.07570420000001832;
    
    
  }
  
  if ([self.detailTitle.text isEqualToString:@"Westminster Abbey"]) {
    
    self.detailTextview.text = @"Westminster Abbey, formally titled the Collegiate Church of St Peter at Westminster, is a large, mainly Gothic abbey church in the City of Westminster, London, just to the west of the Palace of Westminster.";
    
    latitude = 51.4994174;
    longitude = -0.1275705000000471;
    
    
  }
  
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//경로 찾기
- (IBAction)directions:(id)sender {
  
  NSString *url = [NSString stringWithFormat:@"http://maps.apple.com/maps?daddr=%f,%f", latitude,longitude];
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:@{} completionHandler:nil];
  
  
}
@end
