//
//  SideBarTVC.m
//  MemoryApp
//
//  Created by Samuel K on 2018. 4. 25..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "SideBarTVC.h"

@interface SideBarTVC ()

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray <UIImage *> *icons;

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *emailLabel;
@property (nonatomic, strong) IBOutlet UIImageView *profileImageView;

@end

@implementation SideBarTVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
  [self setupUIandData];
  [self loadUserProfile];
  [self addHeaderView];
}

- (void) setupUIandData {
  
  self.titles = @[@"새글 작성하기", @"친구 새글", @"달력으로 보기", @"통계", @"계정 관리"];
  self.icons = @[[UIImage imageNamed:@"icon01"], [UIImage imageNamed:@"icon02"], [UIImage imageNamed:@"icon03"], [UIImage imageNamed:@"icon04"], [UIImage imageNamed:@"icon05"], [UIImage imageNamed:@"icon06"]];
  
  self.nameLabel = [UILabel new];
  self.emailLabel = [UILabel new];
  self.profileImageView = [UIImageView new];
  
}

-(void)loadUserProfile {
  
  if (self.nameLabel.text == nil) {
    self.nameLabel.text = @"Guest";
    self.emailLabel.text = @"";
    self.profileImageView.image = [UIImage imageNamed:@"account"];
  } else {
   
    //Realm을 통하여 데이터를 읽어온다.
    
    
  }
}

-(void)addHeaderView {
  
  UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 70)];
  headerView.backgroundColor = UIColor.brownColor;
  self.tableView.tableHeaderView = headerView;
  
  //기본 정보 추가
  self.nameLabel.frame = CGRectMake(70, 15, (headerView.frame.size.width/3)*2, 30);
  self.nameLabel.textAlignment = NSTextAlignmentLeft;
  self.nameLabel.textColor = UIColor.whiteColor;
  self.nameLabel.font = [UIFont boldSystemFontOfSize:15];
  self.nameLabel.backgroundColor = UIColor.clearColor;
  
  [headerView addSubview:self.nameLabel];
  
  
  self.emailLabel.frame = CGRectMake(70, 30, (headerView.frame.size.width/3)*2, 30);
  self.emailLabel.textAlignment = NSTextAlignmentLeft;
  self.emailLabel.font = [UIFont boldSystemFontOfSize:15];
  self.emailLabel.backgroundColor = UIColor.clearColor;
  
  [headerView addSubview:self.nameLabel];
  
  self.profileImageView.frame = CGRectMake(10, 10, 50, 50);
  
  self.profileImageView.layer.cornerRadius = (self.profileImageView.frame.size.width /2);
  self.profileImageView.layer.borderWidth = 0;
  self.profileImageView.layer.masksToBounds = true;
  
  [self.view addSubview:self.profileImageView];
  
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSString *cellIdentifier = @"menucell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
  
  cell.textLabel.text = self.titles[indexPath.row];
  cell.imageView.image = self.icons[indexPath.row];
  
  cell.textLabel.font = [UIFont systemFontOfSize:14];
  
  return cell;
  
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (indexPath.row == 0) {
    
    UIViewController *uv = [UIViewController new];
    uv = [self.storyboard instantiateViewControllerWithIdentifier:@"MemoForm"];
    UINavigationController *target = self.revealViewController.frontViewController;
    
    [target pushViewController:uv animated:YES];
    [self.revealViewController revealToggle:self];
    
  } else if (indexPath.row == 4) {
    
    UIViewController *uv = [UIViewController new];
    uv = [self.storyboard instantiateViewControllerWithIdentifier:@"_profile"];
    
    [self presentViewController:uv animated:YES completion:^{
      [self.revealViewController revealToggle:self];
    }];
    
    
  }
}



















@end
