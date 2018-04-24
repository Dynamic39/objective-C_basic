//
//  ViewController.m
//  WebViewApp
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
 
  //인디케이터 설정
  NSTimer *timer;
  
  
}
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  //webView에 인터넷 페이지를 요청한다.
  [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.co.kr"]]];
  
  //indicater control
  timer = [NSTimer scheduledTimerWithTimeInterval:1.0/2.0 target:self selector:@selector(loading) userInfo:nil repeats:YES];
  
  //SearchBar Control
  self.searchBar.delegate = self;
  
  
}

//webView로딩에 따라 보이게 함.
-(void)loading {
  
  if (self.webView.loading) {
    [self.actInd startAnimating];
  } else {
    [self.actInd stopAnimating];
  }
}

//SearchBar button 컨트롤
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
  
  //검색 주소 세팅
  NSString *urlString = [NSString stringWithFormat:@"http://%@", self.searchBar.text];
  //url make
  NSURL *nsUrl = [NSURL URLWithString:urlString];
  //request call
  NSURLRequest *urlRequest = [NSURLRequest requestWithURL:nsUrl];
  //webview에 load
  [self.webView loadRequest:urlRequest];
  
}

//소문자 고정
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
  searchBar.text = searchText.lowercaseString;
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}


@end
