//
//  ViewController.m
//  SoundBoard
//
//  Created by Samuel K on 2018. 4. 17..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
 
  SystemSoundID dogID;
  SystemSoundID catID;
  SystemSoundID sheepID;
  SystemSoundID frogID;
  SystemSoundID pigID;
  SystemSoundID horseID;
  
}
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  //URL 지정
  NSURL *soundURL1 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Dog" ofType:@"wav"]];
  AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL1, &dogID);
  
  NSURL *soundURL2 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Cat" ofType:@"wav"]];
  AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL2, &catID);
  
  NSURL *soundURL3 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Sheep" ofType:@"wav"]];
  AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL3, &sheepID);
  
  NSURL *soundURL4 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Frog" ofType:@"wav"]];
  AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL4, &frogID);
  
  NSURL *soundURL5 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Pig" ofType:@"wav"]];
  AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL5, &pigID);
  
  NSURL *soundURL6 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Horse" ofType:@"mp3"]];
  AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL6, &horseID);
  
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  
  
  
}


- (IBAction)dog:(id)sender {
  
  AudioServicesPlaySystemSound(dogID);
  
}

- (IBAction)cat:(id)sender {
  
  AudioServicesPlaySystemSound(catID);
  
}

- (IBAction)sheep:(id)sender{
  
  AudioServicesPlaySystemSound(sheepID);
  
}

- (IBAction)frog:(id)sender {
  
  AudioServicesPlaySystemSound(frogID);
  
}

- (IBAction)pig:(id)sender {
  
  AudioServicesPlaySystemSound(pigID);
}

- (IBAction)horse:(id)sender {
  AudioServicesPlaySystemSound(horseID);
}




@end
