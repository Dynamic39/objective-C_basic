//
//  ViewController.m
//  SDImageSample
//
//  Created by Samuel K on 2018. 4. 23..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "SDWebImageCell.h"


@interface ViewController ()
{
  NSArray *dataSource;
}

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  dataSource = [[NSArray alloc] initWithObjects:
                 @{@"url":@"http://cfile21.uf.tistory.com/image/234A604C527A0CAA192874"},
                 @{@"url":@"http://cfile5.uf.tistory.com/image/2444204C527A0CAD1A72BC"},
                 @{@"url":@"http://cfile10.uf.tistory.com/image/237F784C527A0CB0029F68"},
                 @{@"url":@"http://cfile30.uf.tistory.com/image/2652A94C527A0CB3157182"},
                 @{@"url":@"http://cfile29.uf.tistory.com/image/24379C4C527A0CB6217984"},
                 @{@"url":@"http://cfile26.uf.tistory.com/image/21541C4C527A0CB915F207"},
                 @{@"url":@"http://cfile30.uf.tistory.com/image/2136404C527A0CBC2311F0"},
                 @{@"url":@"http://cfile26.uf.tistory.com/image/2126B54C527A0CBF2A030C"},
                 nil];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  SDWebImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  
  if (cell == nil) {
    cell = [[SDWebImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
  }
  
  cell.showBackgroundImg.contentMode = UIViewContentModeScaleAspectFit;
  //URL 설정
  NSURL *url = [[dataSource objectAtIndex:indexPath.row] valueForKey:@"url"];
  [cell.showBackgroundImg sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholder"]];
  
  
  return cell;
  
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 90;
}













@end
