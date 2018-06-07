//
//  ViewController.m
//  DispatchSample
//
//  Created by Samuel K on 2018. 5. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
//  //BackgroundTask 실행
//  BackgroundTask *thread = [[BackgroundTask alloc] init];
//  [thread start];
//
//
//  //실행할 작업을 메서드로 구현한 후, 새로운 스레드에 넣는다
//  NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(bacgroundPrint) object:nil];
//  [thread1 start];
//
//  //자동으로 스레드가 실행되는 함수
//  [NSThread detachNewThreadSelector:@selector(bacgroundPrint2) toTarget:self withObject:nil];
//
//  [NSThread detachNewThreadWithBlock:^{
//    //블록안에 메서드 넣는것도 가능.
//
//    [self bacgroundPrint3];
//
//  }];
  

}


//-(void)bacgroundPrint {
//  NSLog(@"Test Thread1 Start!!");
//
//  for (NSInteger i = 1; i<100; i++) {
//      NSLog(@"Test Thread1");
//  }
//
//
//}
//
//-(void)bacgroundPrint2 {
//  NSLog(@"Test Thread2 Start!!");
//
//  for (NSInteger i = 1; i<100; i++) {
//    NSLog(@"Test Thread2");
//  }
//
//}
//
//-(void)bacgroundPrint3 {
//  NSLog(@"Test Thread3 Start!!");
//
//  for (NSInteger i = 1; i<100; i++) {
//    NSLog(@"Test Thread3");
//  }
//}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

-(void)backgroundTask {
  self.stop = NO;
  int cnt = 1;
  
  NSLog(@"start Task in %@...", [NSThread currentThread]);
  
  while (!self.stop && cnt <= 100) {
    NSLog(@"run task #%d in %@...", cnt, [NSThread currentThread]);
    cnt += 1;
    [NSThread sleepForTimeInterval:0.1];
  }
  
  @synchronized (self) {
    self.runningTaskCount -= 1;
  }
  
  //메인 스레드로 돌려준다.
  [self performSelectorOnMainThread:@selector(updateLabel) withObject:nil waitUntilDone:false];
  NSLog(@"end task in %@...", [NSThread currentThread]);
  
}

//메인스레드에서 실행될 메서드를 만들어 준다.
-(void)updateLabel {
  
  self.runnningTaskCountLabel.text = [NSString stringWithFormat:@"%ld", self.runningTaskCount];
  
}

- (IBAction)startTask:(id)sender {
  
  @synchronized (self) {
    self.runningTaskCount += 1;
  }
  
  self.runnningTaskCountLabel.text = [NSString stringWithFormat:@"%ld", self.runningTaskCount];
  
  [NSThread detachNewThreadSelector:@selector(backgroundTask) toTarget:self withObject:nil];
  
}

- (IBAction)stopTask:(id)sender {
  
  self.stop = YES;
  self.runningTaskCount = 0;
  self.runnningTaskCountLabel.text = [NSString stringWithFormat:@"%ld",self.runningTaskCount];
  
}
@end
