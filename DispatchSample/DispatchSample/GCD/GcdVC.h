//
//  GcdVC.h
//  DispatchSample
//
//  Created by Samuel K on 2018. 5. 9..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>

//블록에 새로운 이름 추가
typedef void (^SimpleBlock)(void);
typedef void (^ResultCompletionBlock)(int result);

@interface GcdVC : UIViewController

//반복적으로 사용되는 세게의 작업을 속성ㅇ로 선언

@property (copy, nonatomic) SimpleBlock task1;
@property (copy, nonatomic) SimpleBlock task2;
@property (copy, nonatomic) SimpleBlock task3;

- (IBAction)submitTaskSynchronnouslyToSerialQueue:(id)sender;
- (IBAction)submitTaskSynchronouslyToConcurrentQueue:(id)sender;
- (IBAction)submitTaskAsynchronouslyToConcurrentQueue:(id)sender;
- (IBAction)runBackgroundTaskAndUpdateUI:(id)sender;

- (IBAction)runTaskGroupAndWait:(id)sender;
- (IBAction)runTaskGropuAndNotify:(id)sender;

- (IBAction)synchronizeWithSemaphore:(id)sender;
- (IBAction)runConcurrentLoop:(id)sender;





@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

-(void)runBackgroundTask:(ResultCompletionBlock)completion;


@end
