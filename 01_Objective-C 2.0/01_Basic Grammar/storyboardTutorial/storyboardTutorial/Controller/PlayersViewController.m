//
//  PlayersViewController.m
//  storyboardTutorial
//
//  Created by Samuel K on 2018. 4. 10..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "PlayersViewController.h"
#import "Player.h"
#import "PlayerCell.h"

@interface PlayersViewController ()

@end

@implementation PlayersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startPrint
{
  NSLog(@"Sample TableView app Launched");
}

//이미지 레이팅을 표시하는 메서드 정리
-(UIImage *) imageForRating:(int)rating
{
  switch (rating) {
    case 1: return [UIImage imageNamed:@"oneStar"];
    case 2: return [UIImage imageNamed:@"twoStar"];
    case 3: return [UIImage imageNamed:@"threeStar"];
    case 4: return [UIImage imageNamed:@"fourStar"];
    case 5: return [UIImage imageNamed:@"fiveStar"];
  }
  return nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return [self.players count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"PlayerCell";
  
  PlayerCell *cell = (PlayerCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  Player *player = (self.players)[indexPath.row];
  
  
  //객체에 태그를 붙여서 어레이의 값을 화면에 표기한다.
//  UILabel *nameLabel = (UILabel *)[cell viewWithTag:100];
//  nameLabel.text = player.name;
//  UILabel *gameLabel = (UILabel *)[cell viewWithTag:101];
//  gameLabel.text = player.game;
//  UIImageView *ratingImageView = (UIImageView *)[cell viewWithTag:102];
//  ratingImageView.image = [self imageForRating:player.rating];
  
  //UITableViewCell Class를 지정하고, 연결하여 준다.
  cell.nameLabel.text = player.name;
  cell.gameLabel.text = player.game;
  cell.ratingImageView.image = [self imageForRating:player.rating];
  
  return cell;
  
}



@end
