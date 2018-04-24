//
//  SwipeGestureVC.h
//  Actions
//
//  Created by Samuel K on 2018. 4. 16..
//  Copyright © 2018년 Samuel K. All rights reserved.
//

#import "ViewController.h"

@interface SwipeGestureVC : ViewController

@property (weak, nonatomic) IBOutlet UILabel *gestureLabel;

//새로운 프로퍼티 추가
@property (strong, nonatomic) UISwipeGestureRecognizer *leftSwipe;
@property (strong, nonatomic) UISwipeGestureRecognizer *rightSwipe;
@property (strong, nonatomic) UISwipeGestureRecognizer *upSwipe;
@property (strong, nonatomic) UISwipeGestureRecognizer *downSwipe;

@end
