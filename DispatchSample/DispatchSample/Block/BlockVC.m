//
//  BlockVC.m
//  DispatchSample
//
//  Created by Samuel K on 2018. 5. 11..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "BlockVC.h"


//Enum의 경우, 정수형에 쓴다.
typedef NS_ENUM(int, rawNumber) {
    
    rawNumber_number0 = 0,
    rawNumber_number1,

};

#define SAMPLE_STRING @"thisIsSample" // define의 사용 방법도, 다른 타입의 입력방식과 비슷하다.
#define NETWORK_ACCESS NO
#define SAMPLE_RATE 30000

typedef void (^ResponseBlock)(NSData *data, NSError *error); // 함수형 블록

// Set..
typedef void (^simpleLogBlock)(void);
void performBlock(simpleLogBlock block) {
  block ();
}

@interface BlockVC ()

//블록의 경우, 새로운 이름을 부여하여 진행한다.

@property (nonatomic, strong) ResponseBlock responseblock; // 함수형 블록을 사용하는 프로퍼티
-(void) startRequestWithCompletion:(ResponseBlock)responseBlock;


@end

@implementation BlockVC

//Completion Block을 만들어 보자.

- (void)startRequestWithCompletion:(ResponseBlock)responseBlock {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
  void (^simpleBlock)(void) = ^{
    NSLog(@"Hello, world!");
      
      NSString *sample = @"thisIsSample";
      
      int sampleNumber;
      
      sampleNumber = 0;
      
      if (sampleNumber == rawNumber_number0) {
          NSLog(@"Sample Code 1");
      }
      
      NSLog(@"%@", SAMPLE_STRING);
      
      if (NETWORK_ACCESS) {
          NSLog(@"네트워크가 연결되었습니다");
      } else {
          NSLog(@"네트워크가 연결되어 있지 않습니다. 디바이스를 확인하여 주십시오.");
          NSLog(@"%i", SAMPLE_RATE);
      }
      
      
      
      
      
  };
  
  simpleBlock();
  
  void (^simpleParameterBlock)(NSString *) = ^(NSString *str) {
    
    NSLog(@"Hello, %@", str);
    
    performBlock(^{
      NSLog(@"Success!!");
    });
    
  };
  simpleParameterBlock(@"Sam");
  
  
  NSArray *list = @[@"Apple", @"Orange", @"Melon"];
  [list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    NSLog(@"%@",obj);
  }];
  

  
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

@end
