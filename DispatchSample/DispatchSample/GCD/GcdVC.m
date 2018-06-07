//
//  GcdVC.m
//  DispatchSample
//
//  Created by Samuel K on 2018. 5. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "GcdVC.h"

@interface GcdVC ()

@end

@implementation GcdVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
  //초기화
  self.task1 = ^{
    NSLog(@"start Task1");
    
    for (int i = 0; i < 3; i++) {
      NSLog(@"run Task #1");
      [NSThread sleepForTimeInterval:0.3];
    }
    NSLog(@"end Task1");
  };
  
  self.task2 = ^{
    NSLog(@"start Task2");
    
    for (int i = 0; i < 3; i++) {
      NSLog(@"run Task #2");
      [NSThread sleepForTimeInterval:0.3];
    }
    NSLog(@"end Task2");
  };
  
  
  self.task3 = ^{
    NSLog(@"start Task3");
    
    for (int i = 0; i < 3; i++) {
      NSLog(@"run Task #3");
      [NSThread sleepForTimeInterval:0.3];
    }
    NSLog(@"end Task3");
  };
  
  
  
}


- (void)runBackgroundTask:(ResultCompletionBlock)completion {
  
  
  __weak typeof(self) weakSelf = self;
  
  dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
    
    dispatch_async(dispatch_get_main_queue(), ^{
      
      weakSelf.resultLabel.text = @"Start";
      
    });
    
    [NSThread sleepForTimeInterval:2];
    
    int sum = 0;
    for (int i = 1; i < 100; i++) {
      
      sum += 1;
      
      dispatch_async(dispatch_get_main_queue(), ^{
        weakSelf.resultLabel.text = [NSString stringWithFormat:@"Processing #%d...", i];
      });
      
      [NSThread sleepForTimeInterval:0.1];
      
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
      weakSelf.resultLabel.text = @"Done! Wating for result";
    });
    
    if (completion) {
      completion(sum);
    }
    
  });
  
  
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

- (IBAction)submitTaskSynchronnouslyToSerialQueue:(id)sender {
  
  
  //두개의 작업을 추가하여, 실행 순서를 확인한다.
  dispatch_queue_t taskQueue = dispatch_queue_create("serial_queue", DISPATCH_QUEUE_SERIAL);
  
  NSLog(@"before submit Task #1");
  dispatch_sync(taskQueue, self.task1); // 실행할 큐와 블록을 설정한다.
  NSLog(@"after submit Task #1");
  
  NSLog(@"before submit Task #2");
  dispatch_sync(taskQueue, self.task2); // 실행할 큐와 블록을 설정한다.
  NSLog(@"after submit Task #2");
  
  
  
  
}

- (IBAction)submitTaskSynchronouslyToConcurrentQueue:(id)sender {
  
  dispatch_queue_t taskQueue = dispatch_queue_create("concurrent_queue", DISPATCH_QUEUE_CONCURRENT);
  
  NSLog(@"before submit Task #1");
  dispatch_sync(taskQueue, self.task1); // 실행할 큐와 블록을 설정한다.
  NSLog(@"after submit Task #1");
  
  NSLog(@"before submit Task #2");
  dispatch_sync(taskQueue, self.task2); // 실행할 큐와 블록을 설정한다.
  NSLog(@"after submit Task #2");
  
  
  
}

- (IBAction)submitTaskAsynchronouslyToConcurrentQueue:(id)sender {
  
  dispatch_queue_t taskQueue = dispatch_queue_create("concurrent_queue", DISPATCH_QUEUE_CONCURRENT);
  
  NSLog(@"before submit Task #1");
  dispatch_async(taskQueue, self.task1); // 실행할 큐와 블록을 설정한다.
  NSLog(@"after submit Task #1");
  
  NSLog(@"before submit Task #2");
  dispatch_async(taskQueue, self.task2); // 실행할 큐와 블록을 설정한다.
  NSLog(@"after submit Task #2");

}

- (IBAction)runBackgroundTaskAndUpdateUI:(id)sender {
  

  __weak typeof(self) weakSelf = self;
  
  [self runBackgroundTask:^(int result) {
    
    [NSThread sleepForTimeInterval:2];
    
    dispatch_async(dispatch_get_main_queue(), ^{
      weakSelf.resultLabel.text = @(result).stringValue;
    });
    
    
  }];
  
  
}

- (IBAction)runTaskGroupAndWait:(id)sender {
  
  dispatch_queue_t globalQueue = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
  dispatch_group_t taskGroup = dispatch_group_create();
  
  
  NSLog(@"before submit Tasks");
  dispatch_group_async(taskGroup, globalQueue, self.task1);
  dispatch_group_async(taskGroup, globalQueue, self.task2);
  dispatch_group_async(taskGroup, globalQueue, self.task3);
  NSLog(@"after submit Tasks");
  
  dispatch_group_wait(taskGroup, DISPATCH_TIME_FOREVER);
  NSLog(@"Done!");
  NSLog(@"after Wait");

}

- (IBAction)runTaskGropuAndNotify:(id)sender {
  
  dispatch_queue_t globalQueue = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
  dispatch_group_t taskGroup = dispatch_group_create();
  
  NSLog(@"before submit Tasks");
  dispatch_group_async(taskGroup, globalQueue, self.task1);
  dispatch_group_async(taskGroup, globalQueue, self.task2);
  dispatch_group_async(taskGroup, globalQueue, self.task3);
  NSLog(@"after submit Tasks");
  
  dispatch_group_notify(taskGroup, globalQueue, ^{
    NSLog(@"done!");
  });
  
  NSLog(@"after notify");
  
  
}

- (IBAction)synchronizeWithSemaphore:(id)sender {
  
  dispatch_queue_t globalQueue = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
  dispatch_semaphore_t sem = dispatch_semaphore_create(3);
  
  for (int i = 1; i <= 10; i++) {
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    NSLog(@"start Task #%d", i);
    
    dispatch_async(globalQueue, ^{
      
      NSTimeInterval randomInterval = (arc4random_uniform(20) + 5) * 0.1;
      [NSThread sleepForTimeInterval:randomInterval];
      
      NSLog(@"Done Task #%d", i);
      
      dispatch_semaphore_signal(sem);
      
    });
  }

}

- (IBAction)runConcurrentLoop:(id)sender {
  
  dispatch_queue_t globalQueue = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
  
  dispatch_async(globalQueue, ^{
    
    NSURL *url = [NSURL URLWithString:@"https://www.apple.com"];
    NSError *error = nil;
    NSString *str = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    
    if (!error) {
      
      NSArray *list = [str componentsSeparatedByString:@"\n"];
      
      CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
      
      for (NSString *str in list) {
        
        NSString *trimmedString = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        if ([trimmedString length] > 5) {
          trimmedString = [trimmedString substringFromIndex:4];
        }
        
        [NSThread sleepForTimeInterval:0.001];
      }
      
      CFAbsoluteTime timeElapsed = CFAbsoluteTimeGetCurrent() - startTime;
      NSLog(@"for-in loop: %f", timeElapsed);
      
      startTime = CFAbsoluteTimeGetCurrent();
      dispatch_apply([list count], globalQueue, ^(size_t index) {
        
        NSString *str = list[index];
        NSString *trimmedString = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        if ([trimmedString length] > 5) {
          trimmedString = [trimmedString substringFromIndex:4];
        }
        [NSThread sleepForTimeInterval:0.001];
        
      });
      
      timeElapsed = CFAbsoluteTimeGetCurrent() - startTime;
      NSLog(@"concurrent loop: %f", timeElapsed);
      
    }
  });
  
}

@end
