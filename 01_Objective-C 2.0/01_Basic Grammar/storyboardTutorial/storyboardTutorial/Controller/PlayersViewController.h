//
//  PlayersViewController.h
//  storyboardTutorial
//
//  Created by Samuel K on 2018. 4. 10..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayersViewController : UITableViewController

//기본적인 변수 선연의 경우, .h 파일을 이용하여 실시한다.
//DataModel이 될 프로퍼티를 설정한다
@property (nonatomic, strong) NSMutableArray *players;

@end
