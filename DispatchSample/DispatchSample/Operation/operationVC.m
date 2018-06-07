//
//  operationVC.m
//  DispatchSample
//
//  Created by Samuel K on 2018. 5. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "operationVC.h"

@interface operationVC ()

@end

@implementation operationVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
  //Operation Queue add
  self.opQueue = [[NSOperationQueue alloc] init];
  self.opQueue.qualityOfService = NSQualityOfServiceUserInitiated;
  
  int cnt = arc4random_uniform(100) + 50;
  self.dataList = [[NSMutableArray alloc] initWithCapacity:cnt];
  
  for (int i = 0; i<cnt; i ++) {
    [self.dataList addObject:@(arc4random_uniform(1000) + 1)];
  }

  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
  
}



- (IBAction)performConcurrentMode:(id)sender {
  
  //Point 1
  if (self.opQueue.operationCount > 0) {
    
    [self.opQueue cancelAllOperations];
    
  }
  
  //Point 2
  SumOperation *sumOp = [[SumOperation alloc] initWithData:self.dataList];
  sumOp.queuePriority = NSOperationQueuePriorityVeryHigh;
  __weak SumOperation *weakSumOp = sumOp;
  [sumOp setCompletionBlock:^{
    
    if (weakSumOp.isCancelled) {
      NSLog(@"Sum Opeation is cancelled. %ld", weakSumOp.result);
    } else {
      NSLog(@"Sum Opearation is finished. %ld", weakSumOp.result);
    }
  }];
  
  AvgOperation *avgOp = [[AvgOperation alloc] initWithData:self.dataList];
  avgOp.queuePriority = NSOperationQueuePriorityVeryLow;
  __weak AvgOperation *weakAvgOp = avgOp;
  
  [avgOp setCompletionBlock:^{
    
    if (weakAvgOp.isCancelled) {
      
      NSLog(@"Avg Operation is cancelled. %f", weakAvgOp.result);
      
    } else {
      
      NSLog(@"Avg Operatiob is finished. %f", weakAvgOp.result);
      
    }
  }];
  
  StringOperation *strOp = [[StringOperation alloc] initWithUrlString:@"https://www.apple.com"];
  strOp.queuePriority = NSOperationQueuePriorityVeryLow;
  __weak StringOperation *weakStrOp = strOp;
  
  [strOp setCompletionBlock:^{
    
    if (weakStrOp.isCancelled) {
      NSLog(@"String Operation is cancelled.");
    } else {
      NSLog(@"String Operation is finished.");
    }
  }];
  
  //Ponit3
  
  [self.opQueue addOperations:@[sumOp, avgOp, strOp] waitUntilFinished:NO];
  
  
  //Point4
  [self.opQueue addOperationWithBlock:^{
    
    int cnt = 0;
    while (cnt < 50) {
      
      NSLog(@"run Block Operationb #%d", cnt);
      cnt += 1;
      
      [NSThread sleepForTimeInterval:0.2];
      
    }
  }];

}

- (IBAction)cancelAllOpeations:(id)sender {
  
  [self.opQueue cancelAllOperations];

}

- (IBAction)performSerialMode:(id)sender {
  
  if (self.opQueue.operationCount > 0) {
    [self.opQueue cancelAllOperations];
  }
  
  SumOperation *sumOp = [[SumOperation alloc] initWithData:self.dataList];
  
  sumOp.queuePriority = NSOperationQueuePriorityVeryHigh;
  __weak SumOperation * weakSumOp = sumOp;
  
  [sumOp setCompletionBlock:^{
    
    if (weakSumOp.isCancelled) {
      NSLog(@"Sum Operation is cancelled. %ld", weakSumOp.result);
    } else {
      NSLog(@"Sum Operation is finished, %ld", weakSumOp.result);
    }
    
  }];
  
  AvgOperation *avgOp = [[AvgOperation alloc] initWithData:self.dataList];
  avgOp.queuePriority = NSOperationQueuePriorityVeryHigh;
  
  __weak AvgOperation *weakAvgOp = avgOp;
  
  [avgOp setCompletionBlock:^{
    
    if (weakAvgOp.isCancelled) {
      NSLog(@"Avg Operation is cancelled. %f", weakAvgOp.result);
    } else {
      NSLog(@"Avg Operation");
    }
    
  }];
  
  //Point 1
  [avgOp addDependency:sumOp];
  
  StringOperation *strOp = [[StringOperation alloc] initWithUrlString:@"https://apple.com"];
  strOp.queuePriority = NSOperationQueuePriorityVeryLow;
  
  __weak StringOperation *weakStrOp = strOp;
  [strOp setCompletionBlock:^{
    
    if (weakStrOp.isCancelled) {
      NSLog(@"String Operation is cancelled");
    } else {
      NSLog(@"String Operation is finished");
    }
    
  }];
  
  [strOp addDependency:avgOp];
  
  NSBlockOperation *blockOp = [NSBlockOperation blockOperationWithBlock:^{
    
    int cnt = 0;
    while (cnt < 50) {
      NSLog(@"run Block Operation #%d", cnt);
      cnt += 1;
      
      [NSThread sleepForTimeInterval:0.2];
    }
    
  }];
  
  __weak NSBlockOperation *weakBlockOp = blockOp;
  [blockOp setCompletionBlock:^{
    
    if (weakBlockOp.isCancelled) {
      NSLog(@"Block Operation is cancelled");
    } else {
      NSLog(@"Block Operation is finished");
    }
  }];
  
  [blockOp addDependency:strOp];
  
  [self.opQueue addOperations:@[sumOp, avgOp, strOp, blockOp] waitUntilFinished:NO];
  
  NSBlockOperation *mainThreadOp = [NSBlockOperation blockOperationWithBlock:^{
    
    if ([NSThread isMainThread]) {
      int cnt = 0;
      while (cnt < 10) {
        NSLog(@"run Main Thread Operation #%d", cnt);
        cnt += 1;
        
        [NSThread sleepForTimeInterval:0.1];
      }
    }
  }];
  
  [mainThreadOp addDependency:blockOp];
  
  //Point2
  
  [[NSOperationQueue mainQueue] addOperation:mainThreadOp];
  
  //Point3
  NSBlockOperation *cancellabelBlockOp = [[NSBlockOperation alloc] init];
  [cancellabelBlockOp addExecutionBlock:^{
    
    if ([NSThread isMainThread]) {
      int cnt = 0;
      while (cnt < 10 && !cancellabelBlockOp.isCancelled) {
        
        NSLog(@"run Cancelable Main Thread Operation $%d", cnt);
        cnt += 1;
        
        [NSThread sleepForTimeInterval:0.1];
        
        
      }
    }
    
    
  }];
  
  
  
  
}
@end
