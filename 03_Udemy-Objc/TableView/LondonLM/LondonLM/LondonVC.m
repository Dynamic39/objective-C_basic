//
//  LondonVC.m
//  LondonLM
//
//  Created by Samuel K on 2018. 4. 18..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "LondonVC.h"
#import "DetailVC.h" // detail view Controller input

@interface LondonVC ()
{
  
  NSArray *title;
  NSArray *description;
  NSArray *image;
  
}

@end

@implementation LondonVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
  //기본적인 배열을 설정한다 - 원래는 Data로 받아야함.
  title = @[@"Big Ben",
            @"Buckingham Palace",
            @"London Eye",
            @"St Pauls Cathedral",
            @"Tower Bridge",
            @"Westminster Abbey"];
  
  description = @[@"London SW1A 0AA",
                  @"London SW1A 1AA",
                  @"London SE1 7PB",
                  @"London EC4M 8AD",
                  @"London SE1 2UP",
                  @"London SW1P 3PA"];
  
  image = @[@"BigBen.jpg",
            @"BuckinghamPalace.jpg",
            @"LondonEye.jpg",
            @"St-Pauls.jpg",
            @"TowerBridge.jpg",
            @"WestminsterAbbey.jpg"];
  
  //긴 back버튼의 타이틀을 줄인다.
  [[self navigationItem] setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil]];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return title.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  LondonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LondonCell" forIndexPath:indexPath];
  
  //UI에 넣을 자료 확인
  cell.cellTitle.text = title[indexPath.row];
  cell.cellDescription.text = description[indexPath.row];
  cell.cellImageView.image = [UIImage imageNamed:image[indexPath.row]];
  
  return cell;
  
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 140;
}


#pragma mark - Navigation

//data 전달
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
  if ([[segue identifier] isEqualToString:@"showDetail"]) {
    
    DetailVC *detailViewController = [segue destinationViewController]; // 목적지 설정
    
    NSIndexPath *myindexPath = [self.tableView indexPathForSelectedRow]; // indexPath 설정
    
    int row = (int)[myindexPath row];
    
    detailViewController.detailModal = @[title[row], description[row], image[row]];
    
    
    
    
    
  }
  
}







@end
