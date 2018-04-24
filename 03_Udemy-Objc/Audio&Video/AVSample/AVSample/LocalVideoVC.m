//
//  LocalVideoVC.m
//  AVSample
//
//  Created by Samuel K on 2018. 4. 17..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "LocalVideoVC.h"

@interface LocalVideoVC ()

@end

@implementation LocalVideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
  NSString *embedCod = @"https://youtu.be/jLaOK-IR7XM";
  
  
  
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


- (IBAction)playVideo:(id)sender {
  
  //Video Play진행
  //URL 설정
  NSURL *videoURL = [[NSBundle mainBundle] URLForResource:@"sampleVideo" withExtension:@"mp4"];
  AVPlayer *player = [AVPlayer playerWithURL:videoURL];
  
  //AV VC init
  AVPlayerViewController *controller = [[AVPlayerViewController alloc] init];
  controller.player = player;
  [player play];
  
  [self presentViewController:controller animated:YES completion:nil];
  
}

- (IBAction)streamVideo:(id)sender {
  
  //MP4 형식만 가능
  NSURL *videoURL = [NSURL URLWithString:@"https://www.youtube.com/watch?v=jLaOK-IR7XM"];
  AVPlayer *player = [AVPlayer playerWithURL:videoURL];
  
  AVPlayerViewController *controller = [[AVPlayerViewController alloc] init];
  controller.player = player;
  
  [player play];
  
  [self presentViewController:controller animated:YES completion:nil];
  
  
  
  
}

- (IBAction)youtubeVideo:(id)sender {
}
@end
