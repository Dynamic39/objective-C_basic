//
//  ViewController.m
//  DevslopesTutorials
//
//  Created by Samuel K on 2018. 5. 4..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *name;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  
  

  
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:YES];
  
  self.ResultLabel.text = self.name;
  
  
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
  if ([segue.identifier isEqualToString:@"pass"]) {
    
    
    SecondViewController *anotherVC = [segue destinationViewController];
    
    //이동한 데이터를 가지고 오기 위하여 delegate를 가지고 온다.
    anotherVC.delegate = self;
    
    
  }
  
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


- (IBAction)passData:(id)sender {
  
  
  [self performSegueWithIdentifier:@"pass" sender:nil];
  
}


//Protocol에 의해 생성된 데이터를 가지고 가공한다.
- (void)toPassData:(NSString *)textfieldContent {
  
  self.name = textfieldContent;
  
  
}



@end
