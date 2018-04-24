//
//  ViewController.m
//  PirateApp
//
//  Created by Samuel K on 2018. 4. 18..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
  NSDictionary *dataForJSON;
  NSData *JSONData;
  NSDictionary *dicFromJSON;
  
}

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  
  NSError *err;
  dataForJSON = @{@"number":[1,2,3], @"name":@"samkyu", @"age":@32, @"hobby":@{@"first":@"boxing",
    @"second":@"Phone",
    @"Third":@"Game"
  }};
  
//  NSMutableDictionary *contentDictionary = [[NSMutableDictionary alloc]init];
//  [contentDictionary setValue:@"a" forKey:@"b"];
//  [contentDictionary setValue:@"c" forKey:@"d"];
  
  JSONData = [NSJSONSerialization dataWithJSONObject:dataForJSON options:NSJSONWritingPrettyPrinted error:&err];
  NSString *kJson = [[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
  
  NSLog(@"\n%@", kJson);
  
  //NSData *data = [kJson dataUsingEncoding:NSUTF8StringEncoding];
  NSError *e;
  dicFromJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:nil error:&e];
  
  NSLog(@"%@", [dicFromJSON objectForKey:@"name"]);
  
  
  
  

  
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  
}


@end
